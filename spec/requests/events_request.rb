require 'rails_helper'

describe 'Events' do
  def result
    JSON.parse(response.body)
  end

  describe 'index' do
    before :each do
      3.times do
        FactoryGirl.create(:event)
      end

      get '/admin/events', format: :json
    end

    it 'returns success' do
      expect(response.status).to eq(200)
    end

    it 'returns events' do
      expect(result['events'].size).to eq(3)
    end

    it 'returns correct fields' do
      required_fields = ['id', 'title', 'event_date', 'video_url', 'is_prior', 'banner_url']

      event = result['events'][0]

      expect(event.keys.size()).to eq(required_fields.size())
      required_fields.each do |k|
        expect(event.keys).to include(k)
      end
    end
  end

  describe 'create' do
    context 'success' do
      before :each do
        @event = FactoryGirl.create(:event)
        params = {
          title:      'Event 1',
          event_date: '10/01/2015',
          video_url:  'https://youtube.com/Yuihasd56qd',
          is_prior:   'true',
          banner:     FACTORY_PICTURE_UPLOAD
        }

        post '/admin/events', event: params
      end

      it 'returns success' do
        expect(response.status).to eq(201)
      end

      it 'returns created object' do
        expect(result).not_to be_empty
      end

      it 'creates event' do
        event = Event.last

        expect(event.title).to eq('Event 1')
        expect(event.event_date).to eq(Date.parse('10/01/2015'))
        expect(event.video_url).to eq('https://youtube.com/Yuihasd56qd')
        expect(event.is_prior).to eq(true)
        expect(event.banner).not_to be_nil
      end
    end
  end

  describe 'update' do
    context 'success' do
      before :each do
        @event = FactoryGirl.create(:event)

        params = {
          title:      'Event 1',
          event_date: '10/01/2015',
          video_url:  'https://youtube.com/Yuihasd56qd',
          is_prior:   'true',
          banner:     FACTORY_PICTURE_UPLOAD          
        }

        put "/admin/events/#{@event.id}", event: params
      end

      it 'returns success' do
        expect(response.status).to eq(200)
      end

      it 'updates event' do
        event = Event.last

        expect(event.title).to eq('Event 1')
        expect(event.event_date).to eq(Date.parse('10/01/2015'))
        expect(event.video_url).to eq('https://youtube.com/Yuihasd56qd')
        expect(event.is_prior).to eq(true)
        expect(event.banner).not_to be_nil
      end
    end
  end

  describe 'destroy' do
    context 'success' do
      before :each do
        @event = FactoryGirl.create(:event)

        delete "/admin/events/#{@event.id}"
      end

      it 'returns success' do
        expect(response.status).to eq(200)
      end

      it 'destroys section' do
        expect(Event.find_by(id: @event.id)).to eq(nil)
      end
    end
  end
end