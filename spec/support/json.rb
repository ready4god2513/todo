module RequestHelpers

  module JSONResponse

    def json
      @json ||= JSON.parse(response.body)
    end

  end

end