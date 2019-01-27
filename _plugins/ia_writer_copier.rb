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
      src_base = File.join(src, category)
      src_dir = File.join(src_base, "**/*")
      dest_base = File.join(dest, category, '_posts')

      FileUtils.mkdir_p dest_base

      Dir.glob(src_dir) do |file|
        if File.directory? file
          FileUtils.mkdir_p File.join(dest_base,file.split(src_base)[1])
          next
        end

        file_base_dir = File.dirname(file).split(src_base)[1] || ""
        filename = File.basename(file)
        destdir = File.join(dest_base, file_base_dir)

        if !filename.match?(/^\d{,4}-\d{,2}-\d{,2}/) && File.extname(filename).match?(/#{@markdown_ext}/)
          date = File.birthtime(file).strftime('%Y-%m-%d')
          filename = "#{date}-#{filename}"
        end

        destination_file = File.join(destdir, filename)

        logger.info "cp #{file} #{destination_file}"
        FileUtils.cp file, destination_file
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
end

Jekyll::Hooks.register :site, :after_reset do |site|
  p site.config['serve']
  p site.config
  IAWriterCopier.new(site.config).copy if site.config[IAWriterCopier::CONFIG_KEY] && !site.config['serving']
end
