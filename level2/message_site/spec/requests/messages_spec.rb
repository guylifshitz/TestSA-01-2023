require 'rails_helper'

RSpec.describe "Messages", type: :request do

  describe "GET /index" do
    it "returns http success" do
      create(:message)
      get messages_path
      expect(response).to be_successful
      expect(response.body).to include "John"
    end
  end

  describe "GET /tags/name/messages" do
    it "returns http success" do
      create(:rigolo_message)
      create(:message)
      get "/tags/Rigolo/messages"
      expect(response).to be_successful
      expect(response.body).to include "John"
      expect(response.body).to include "Rigolo"
      expect(response.body).not_to include "Larry"
      expect(response.body).not_to include "Urgent"
    end
  end

  describe "GET /show" do
    it "returns http success" do
      create(:message)
      get message_path(Message.first)
      expect(response).to be_successful
      expect(response.body).to include "John"
    end
  end

  
  describe "GET /new" do
    before :all do
      @tag = :tag
      @tags = [@tag]
    end

    it "returns http success" do
      get "/messages/new"
      expect(response).to have_http_status(:success)
      expect(response.body).to include("New message")
    end
  end

  describe "POST /create" do
    
    before :all do
      @tag = create(:tag)
      @tags = [@tag]
    end

    let(:valid_attributes) { {
      "author" => 'John',
      "body_french" => 'LECHAT',
      "body_pioupiou" => '',
      "tag_id" => @tag.id,
    } }
    let(:invalid_attributes) { {
      "author" => '',
      "body_french" => 'LECHAT',
      "body_pioupiou" => '',
      "tag_id" => @tag.id,
    } }

    context "with valid parameters" do
      it "creates a new Message" do
        expect {
          post messages_path, params: { message: valid_attributes }
        }.to change(Message, :count).by(1)
      end

      it "redirects to the created message" do
        post messages_path, params: { message: valid_attributes }
        expect(response).to redirect_to(message_url(Message.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Message" do
        expect {
          post messages_path, params: { message: invalid_attributes }
        }.to change(Message, :count).by(0)
      end
    end
  end

  describe "JSON responses" do
    context "/message/:id" do
      it "returns http success" do
        create(:message)
        get api_message_path(Message.first)
        expect(response).to be_successful
        expect(response.body).to include "John"
      end

      it "returns a JSON response with correct keys" do
        create(:message)
        get api_message_path(Message.first)

        hash_body = nil
        expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
        expect(hash_body.keys).to match_array(["author", "body_french", "body_pioupiou", "created_at", "id", "tag", "tag_id", "updated_at"])
      end
    end

    context "/messages" do
      it "returns http success" do

        create(:message)
        create(:rigolo_message)

        get messages_path

        expect(response).to be_successful
        expect(response.body).to include "John"
      end

      it "returns a JSON response with correct count and keys" do
        create(:message)
        create(:rigolo_message)

        get api_messages_path

        hash_body = nil
        expect { hash_body = JSON.parse(response.body) }.not_to raise_exception
        expect(hash_body.length).to eq(2)
        expect(hash_body[1].keys).to match_array(["author", "body_french", "body_pioupiou", "created_at", "id", "tag", "tag_id", "updated_at"])
      end

      it "returns the number of entries passed in per_page parameter" do
        create(:message)
        create(:rigolo_message)

        get api_messages_path(:per_page => 1)

        hash_body = nil
        expect { hash_body = JSON.parse(response.body) }.not_to raise_exception
        expect(hash_body.length).to eq(1)
        expect(hash_body[0].keys).to match_array(["author", "body_french", "body_pioupiou", "created_at", "id", "tag", "tag_id", "updated_at"])
      end
    end

    context "/tags/:name/messages" do
      it "returns http success" do

        create(:message)
        create(:rigolo_message_2)
        create(:rigolo_message)

        get "/api/tags/Rigolo/messages.json"

        expect(response).to be_successful
        expect(response.body).to include "John"
      end

      it "returns a JSON response with correct count and keys" do
        create(:message)
        create(:rigolo_message)
        create(:rigolo_message_2)

        get "/api/tags/Rigolo/messages.json"

        hash_body = nil
        expect { hash_body = JSON.parse(response.body) }.not_to raise_exception
        expect(hash_body.length).to eq(2)
        expect(hash_body[1].keys).to match_array(["author", "body_french", "body_pioupiou", "created_at", "id", "tag", "tag_id", "updated_at"])
      end

      it "returns the number of entries passed in per_page parameter" do
        create(:message)
        create(:rigolo_message)
        create(:rigolo_message_2)
        
        get "/api/tags/Rigolo/messages.json?per_page=1"

        hash_body = nil
        expect { hash_body = JSON.parse(response.body) }.not_to raise_exception
        expect(hash_body.length).to eq(1)
        expect(hash_body[0].keys).to match_array(["author", "body_french", "body_pioupiou", "created_at", "id", "tag", "tag_id", "updated_at"])
      end
    end
  end

end
