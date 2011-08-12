class EventsController < ApplicationController

  before_filter :find_event, :only => [:show ,:edit,:destroy,:update]
  def index
    @events = Event.all
    @events = Event.page(params[:page]).per(5)
  end

  def new
    @event = Event.new
  end

  def create
    @event=Event.new(params[:event])
    if @event.save
      flash[:notice] = "Successfully created..."
      redirect_to :action => :index
    else
      flash[:alert] = "Error created..."
      render :action => :new
    end
  end

  def show
    @page_title =@event.name
  end

  def edit
  end

  def update
    if @event.update_attributes(params[:event])
      flash[:notice] = "Successfully updated..."
      redirect_to :action => :show, :id => @event
    else
      flash[:alert] = "Error updated..."
      render  :action => :edit
    end
  end

  def destroy
    @event.destroy
    flash[:alert] = "Successfully delete..."
    redirect_to :action => :index
  end

  protected

  def find_event
    @event = Event.find(params[:id])
  end

end
