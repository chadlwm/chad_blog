class WechatController < ApplicationController
  skip_before_action :verify_authenticity_token

   def index
     logger.info "==========get params content=========="
     logger.info params
     render text: params[:echostr]
   end

   def message
     logger.info "==========post params content=========="
     logger.info params

     content = Hash.from_xml(request.body.read)
     logger.info content
     @xml = content['xml']

     if @xml['MsgType'] == "text"
       if @xml['Content'] == 'articles'
         render "articles", :formats => :xml
       else
         render "message", :formats => :xml
       end
     end
   end
end
