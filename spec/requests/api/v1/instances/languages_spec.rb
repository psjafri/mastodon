# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Languages' do
  describe 'GET /api/v1/instance/languages' do
    before do
      get '/api/v1/instance/languages'
    end

    it 'returns http success and includes supported languages' do
      expect(response)
        .to have_http_status(200)
      expect(response.content_type)
        .to start_with('application/json')
      expect(response.parsed_body)
        .to match_array(supported_locale_expectations)
    end

    def supported_locale_expectations
      LanguagesHelper::SUPPORTED_LOCALES.map do |key, values|
        include(
          code: key.to_s,
          name: values.first
        )
      end
    end
  end
end
