require 'fileutils'
class IAWriterCopier
  CONFIG_KEY = 'iawritercopier'
  attr_accessor :src, :dest, :categories

  def initialize(config)
    @src = config[CONFIG_KEY]['src']
    @dest = config['source']
    @config = config
    @markdown_ext = config['encoding']['markdown_ext'] || 'md'
    @categories = config[CONFIG_KEY]['categories']
    valid?
  end

  def copy
    @categories.each do |category|
      src_dir = File.join(src, category, "*.{#{@markdown_ext}}")
      post_dir = File.join(dest, category, '_posts')

      FileUtils.mkdir_p post_dir

      Dir.glob(src_dir) do |file|
        filename = File.basename(file)

        unless filename.match? /^\d{,4}-\d{,2}-\d{,2}/
          date = File.birthtime(file).strftime('%Y-%m-%d')
          filename = "#{date}-#{filename}"
        end

        destination_file = File.join(post_dir, filename)

        logger.info "cp #{file} #{destination_file}"
        src = IO.read(file)
        unless src.match? /^---/
          src.prepend(frontmatter)
        end
        IO.write(destination_file, src, mode: 'w')
      end
    end
  end

  private

  def valid?
    exists? src
    exists? dest
    logger.error 'Need categories' if categories.empty?
    logger.info "using #{categories.join(',')} categories"
  end


  def exists?(name)
    logger.info "checking for dir: #{name}"
    exists = File.exists? name
    logger.warn "can't find dir: #{name}" unless exists
    exists
  end

  def logger
    Jekyll.logger
  end

  def frontmatter
    <<-STR
---
layout: post
---
    STR
  end
end

Jekyll::Hooks.register :site, :after_reset do |site|
  p site.config['serve']
  p site.config
  IAWriterCopier.new(site.config).copy if site.config[IAWriterCopier::CONFIG_KEY] && !site.config['serving']
end
