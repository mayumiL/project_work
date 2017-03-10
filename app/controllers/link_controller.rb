class LinkController < ApplicationController
    protect_from_forgery

 def update
   link = Link.find(params["id"])
   link.source = params["source"]
   link.target = params["target"]
   link.link_type = params["type"]
   link.save

   render :json => {:status => "ok"}
 end

 def add
   link = Link.create :source => params["source"], :target => params["target"], :link_type => params["type"]
   render :json => {:tid => link.id}
 end

 def delete
   Link.find(params["id"]).destroy
   render :json => {:status => "ok"}
 end
end
