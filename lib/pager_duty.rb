module PagerDuty
  extend self
  def config=(options)
    @config = options
    RestClient.add_before_execution_proc do |req, params|
      req.basic_auth @config[:auth_email], @config[:auth_password]
    end
  end

  def config
    @config
  end

  def url_for_path(path, params = nil)
    if params
      query_string = "?" + params.inject([]) {|buffer,(key,value)| buffer << "#{key}=#{value}" }.join('&')
    else
      query_string = nil
    end
    
    "https://#{@config[:account_subdomain]}.pagerduty.com#{path}#{query_string}"
  end

  def api_url_for_path(path, params = nil)
    url_for_path("/api/v1#{path}", params)
  end
end

require 'pager_duty/schedule'