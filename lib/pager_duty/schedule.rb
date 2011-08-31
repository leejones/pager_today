module PagerDuty
  class Schedule
    def initialize(id)
      @id = id
    end
    
    def entries(params)
      params[:since] = format_time_as_iso8601(params[:since])
      params[:until] = format_time_as_iso8601(params[:until])
      result = RestClient.get PagerDuty.api_url_for_path("/schedules/#{@id}/entries", params)
      Yajl::Parser.parse(result)['entries']
    end

    private

    def format_time_as_iso8601(date)
      if date.is_a?(String)
        return Chronic.parse(date).iso8601
      elsif date.is_a?(Time)
        return date.iso8601
      end
    end
  end
end