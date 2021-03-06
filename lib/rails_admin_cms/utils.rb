module CMS
  extend self

  def rb_all_names(dirname)
    Dir["#{RailsAdminCMS::Engine.root}/#{dirname}/*.rb"].map { |name|
      File.basename(name).sub(/\.rb$/, '')
    } +
    rb_names(dirname)
  end

  # list the ruby file names within a directory (ex.: used to get all viewable names)
  def rb_names(dirname)
    Dir["#{Rails.root}/#{dirname}/*.rb"].map do |name|
      File.basename(name).sub(/\.rb$/, '')
    end
  end

  # list the html file names within a directory (ex.: used to get all page templates)
  def html_names(dirname)
    Dir["#{Rails.root}/#{dirname}/*.html.*"].map do |name|
      File.basename(name).sub(/\.html\..+$/, '').sub(/^_/, '')
    end
  end

  # list the folder names within a directory (ex.: used to get all form models)
  def dir_names(dirname)
    Dir["#{Rails.root}/#{dirname}/*"].select{ |name|
      File.directory? name
    }.map{ |name|
      name.split('/').last
    }
  end

  def options_to_html(hash)
    hash.to_a.map{ |a| %{#{a.first}=#{a.last}} }.join(' ')
  end
end
