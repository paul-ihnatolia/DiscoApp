require 'rails_helper'

describe 'Photos' do
  def result
    JSON.parse(response.body)
  end

  describe 'index' do
    context 'without specific event' do
      before :each do
        3.times do
          FactoryGirl.create(:photo)
        end

        get '/admin/photos', format: :json
      end

      it 'returns success' do
        expect(response.status).to eq(200)
      end

      it 'returns photos' do
        expect(result['photos'].size).to eq(3)
      end

      it 'returns correct fields' do
        required_fields = ['id', 'is_cover', 'photo_url']

        photo = result['photos'][0]

        expect(photo.keys.size()).to eq(required_fields.size())
        required_fields.each do |k|
          expect(photo.keys).to include(k)
        end
      end
    end

    context 'with specific event' do
      it 'returns photos only for specific event' do
        event = FactoryGirl.create(:event)
        another_event = FactoryGirl.create(:event)
        photo = FactoryGirl.create(:photo, event: event)
        another_photo = FactoryGirl.create(:photo, event: another_event)

        get "/admin/events/#{event.id}/photos"

        expect(result['photos'].size).to eq(1)
        expect(result['photos'][0]['id']).to eq(photo.id)
      end
    end

    context 'standalone' do
      it 'returns only standalone photos' do
        event = FactoryGirl.create(:event)
        photo = FactoryGirl.create(:photo, event: nil, standalone: true)
        another_photo = FactoryGirl.create(:photo, event: event)

        get "/admin/photos?standalone=true"

        expect(result['photos'].size).to eq(1)
        expect(result['photos'][0]['id']).to eq(photo.id)
      end
    end
  end

  describe 'create' do
    context 'with event' do
      context 'success' do
        before :each do
          event  = FactoryGirl.create(:event)
          params = {
            is_cover:   'true',
            content:     FACTORY_PICTURE_UPLOAD
          }

          post "/admin/events/#{event.id}/photos", photo: params
        end

        it 'returns success' do
          expect(response.status).to eq(201)
        end

        it 'returns created object' do
          expect(result).not_to be_empty
        end

        it 'creates photo' do
          photo = Photo.last

          expect(photo.is_cover).to be_truthy
          expect(photo.content).not_to be_nil
          expect(photo.event).not_to be_nil
        end
      end
    end

    context 'standalone' do
      it 'creates photo' do
        params = {
          is_cover:   'true',
          content:     FACTORY_PICTURE_UPLOAD,
          standalone:  'true'
        }

        post "/admin/photos", photo: params

        photo = Photo.last

        expect(photo.is_cover).to be_truthy
        expect(photo.content).not_to be_nil
        expect(photo.standalone).to be_truthy
      end
    end
  end

  describe 'update' do
    context 'success' do
      before :each do
        @photo = FactoryGirl.create(:photo, is_cover: false)

        params = {
          is_cover:   'true',
          content:     FACTORY_PICTURE_UPLOAD
        }

        put "/admin/photos/#{@photo.id}", photo: params
      end

      it 'returns success' do
        expect(response.status).to eq(200)
      end

      it 'updates photo' do
        photo = Photo.last

        expect(photo.is_cover).to be_truthy
        expect(photo.content).not_to be_nil
      end
    end
  end

  describe 'destroy' do
    context 'success' do
      before :each do
        @photo = FactoryGirl.create(:photo)

        delete "/admin/photos/#{@photo.id}"
      end

      it 'returns success' do
        expect(response.status).to eq(200)
      end

      it 'destroys section' do
        expect(Photo.find_by(id: @photo.id)).to eq(nil)
      end
    end
  end
end