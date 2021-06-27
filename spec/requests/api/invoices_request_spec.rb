require 'rails_helper'

RSpec.describe 'Api::Invoices', type: :request do
  let(:proxy) { 'http://localhost:3000/api' }
  let(:api_key) { 'api_key' }
  let(:api_key_wrong) { 'api_key_wrong' }

  describe 'POST' do
    describe 'is protected with a private API key' do
      it 'request with the correct API key' do
        post "#{proxy}/invoices",
             params: { api_key: api_key }
        expect(JSON[response.body]['autenthicated']).to be true
      end

      it 'request with the correct API key - falsy' do
        post "#{proxy}/invoices",
             params: { api_key: api_key }
        expect(JSON[response.body]['autenthicated']).not_to be false
      end

      it 'request with the wrong API key' do
        post "#{proxy}/invoices",
             params: { api_key: api_key_wrong }
        expect(JSON[response.body]['autenthicated']).to be false
      end

      it 'request with the wrong API key - falsy' do
        post "#{proxy}/invoices",
             params: { api_key: api_key_wrong }
        expect(JSON[response.body]['autenthicated']).not_to be true
      end
    end

    # describe 'invoice records' do
    #   it 'creates new invoice records' do
    #     post "#{proxy}/invoices",
    #       params: { api_key: api_key }
    #     expect
    #   end
    # end
  end
end
