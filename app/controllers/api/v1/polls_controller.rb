module Api 
  module V1
    class PollsController < ApplicationController
      
      def index
        polls = Poll.order('created_at DESC')
        render json: {
          status: 'SUCCESS',  
          data: polls}, 
          status: 200
      end

      def show
        poll = Poll.find(params[:id])
        render json: {
          status: "SUCCESS",
          data: poll
        }, 
        status: 200
      end    
      
      def create
        poll = Poll.create(poll_params)
        
        if poll.save
          render json: {
            status: "SUCCESS",
            data: poll
          }, 
          status: 201
        else 
          render json: {
            status: "FAILED",
            data: poll.errors
          }, 
          status: 422
        end
      end
      
      def destroy
        poll = Poll.find(params[:id])
        poll.destroy
        render json: {
          status: "SUCCESS"
        }, 
        status: 200
      end
      
      def update
        poll = Poll.find(params[:id])
        
        if poll.update(poll_params)
          render json: {
            status: "SUCCESS",
            data: poll
          }, 
          status: 200
        else 
          render json: {
            status: "FAILED",
            data: poll.errors
          }, 
          status: 422
        end
      end
      
      private
      
      def poll_params
        params.permit(:title, :premise, :url)
      end
      
      
    end     
  end
end
