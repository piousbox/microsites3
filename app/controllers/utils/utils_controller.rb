
require 'fileutils'

class Utils::UtilsController < ApplicationController

  skip_authorization_check
  
  def old_routes
    render 'utils/old_routes'
  end

  def version
    render 'utils/version'
  end

  def clear_sites_cache
    expire_page site_path({ :domainname => @site.domain })
    file_path = Rails.root.join('public', @site.lang, 'sites', "#{@site.domain}.html")
    if File.exist? file_path
      FileUtils.rm file_path
      flash[:notice] = "Site #{@site.domain} expired from cache."
    end
    file_path = Rails.root.join('public', @site.lang, 'sites', @site.domain)
    if File.exist? file_path
      FileUtils.rm_rf file_path
      flash[:notice] = "Site #{@site.domain} expired from cache (2)."
    end
    redirect_to organizer_path
  end

end
