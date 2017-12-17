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

      FileUtils.mkdir_p File.join(dest, category, '_posts')

      Dir.glob(src_dir) do |file|
        filename = File.basename(file)

        unless filename.match? /^\d{,4}-\d{,2}-\d{,2}/
          date = File.ctime(file).strftime('%Y-%m-%d')
          filename = "#{date}-#{filename}"
        end

        destination_file = File.join(dest, category, '_posts', filename)

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
  IAWriterCopier.new(site.config).copy if site.config[IAWriterCopier::CONFIG_KEY]
end
