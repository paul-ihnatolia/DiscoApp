require 'rails_helper'

describe 'Videos' do
  def result
    JSON.parse(response.body)
  end

  describe 'index' do
    before :each do
      3.times do
        FactoryGirl.create(:video)
      end

      get '/admin/videos', format: :json
    end

    it 'returns success' do
      expect(response.status).to eq(200)
    end

    it 'returns videos' do
      expect(result['videos'].size).to eq(3)
    end

    it 'returns correct fields' do
      required_fields = ['id', 'video_type', 'video_url']

      video = result['videos'][0]

      expect(video.keys.size()).to eq(required_fields.size())
      required_fields.each do |k|
        expect(video.keys).to include(k)
      end
    end
  end

  describe 'create' do
    context 'success' do
      before :each do
        @video = FactoryGirl.create(:video)
        params = {
          video_url:  'https://youtube.com/Yuihasd56qd',
          video_type: 'youtube'
        }

        post '/admin/videos', video: params
      end

      it 'returns success' do
        expect(response.status).to eq(201)
      end

      it 'returns created object' do
        expect(result).not_to be_empty
      end

      it 'creates video' do
        video = Video.last

        expect(video.video_type).to eq('youtube')
        expect(video.video_url).to eq('https://youtube.com/Yuihasd56qd')
      end
    end
  end

  describe 'update' do
    context 'success' do
      before :each do
        @video = FactoryGirl.create(:video)

        params = {
          video_url:  'https://vimeo.com/Yuihasd56qd',
          video_type: 'vimeo'
        }

        put "/admin/videos/#{@video.id}", video: params
      end

      it 'returns success' do
        expect(response.status).to eq(200)
      end

      it 'updates video' do
        video = Video.last

        expect(video.video_type).to eq('vimeo')
        expect(video.video_url).to eq('https://vimeo.com/Yuihasd56qd')
      end
    end
  end

  describe 'destroy' do
    context 'success' do
      before :each do
        @video = FactoryGirl.create(:video)

        delete "/admin/videos/#{@video.id}"
      end

      it 'returns success' do
        expect(response.status).to eq(200)
      end

      it 'destroys section' do
        expect(Video.find_by(id: @video.id)).to eq(nil)
      end
    end
  end
end