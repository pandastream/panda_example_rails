# require 'net/http'
# require 'uri'
# require 'yaml'
# 
# class Panda
#   attr_accessor :id, :resolution, :duration, :format, :status, :encodings
# 
#   def initialize(opts={})
#     opts.each do |k,v|
#       send("#{k}=", v) if [:id, :resolution, :duration, :format, :status, :encodings].include?(k)
#     end
#   end
#   
#   class << self
#     attr_accessor :config, :account_key, :api_domain, :api_port, :upload_api_domain
#     
#     def api_domain
#       @api_domain ||= "hq.pandastream.com"
#       @api_domain
#     end
#     
#     def api_port
#       @api_port ||= 80
#       @api_port
#     end
#     
#     def upload_api_domain
#       @upload_api_domain ||= "uplaod.pandastream.com"
#       @upload_api_domain
#     end
#   
#     def load_config
#       self.config = YAML.load_file("#{RAILS_ROOT}/config/panda.yml")[RAILS_ENV] if self.config.nil?
#       self.account_key = self.config["account_key"]
#     end
#   
#     def find(token)
#       response = request(:get, "/videos/#{token}")
#       p = self.new(response[:video])
#       return p
#     end
#   
#     def create
#       p = self.new
#       response = request(:post, "/videos")
#       p.id = response[:video][:id]
#       return p
#     end
#   
#     def videos
#       response = request(:get, "/videos")
#       response[:videos].map {|v| self.new(v[:video]) }
#     end
#   
#     # Makes request to remote service.
#     def request(method, path, params={})
#       self.load_config
#       raise AccountKeyNotSet if self.account_key.nil?
#       params[:account_key] = self.account_key
#       path += ".yaml"
#       http = Net::HTTP.new(self.api_domain, self.api_port)
#     
#       case method
#       when :get
#         response = http.request_get("#{path}?account_key=#{self.account_key}")
#       when :post
#         req = Net::HTTP::Post.new(path)
#         req.form_data = params
#         response = http.request(req)
#       end
#     
#       puts "--> #{response.code} #{response.message} (#{response.body.length})"
#       puts response.body
#       handle_response(response)
#     end
#   
#     # Handles response and error codes from remote service.
#   
#     def handle_response(response)
#       case response.code.to_i
#         when 200...400
#           YAML.load(response.body)
#         when 401
#           raise(UnauthorizedAccess.new(response))
#         when 404
#           raise(ResourceNotFound.new(response))
#         when 500...600
#           raise(ServerError.new(response))
#         else
#           raise(PandaError.new(response, "Unknown response code: #{response.code}"))
#       end
#     end
#   end
#   
#   class PandaError < StandardError; end
#   
#   class ConnectionError < PandaError # :nodoc:
#     attr_reader :response
# 
#     def initialize(response, message = nil)
#       @response = response
#       @message  = message
#     end
# 
#     def to_s
#       "Failed with #{response.code} #{response.message if response.respond_to?(:message)}"
#     end
#   end
#   
#   class AccountKeyNotSet < PandaError; end
#   
#   # 4xx Client Error
#   class ClientError < ConnectionError; end # :nodoc:
#   
#   # 401 Unauthorized
#   class UnauthorizedAccess < ClientError; end # :nodoc
#   
#   # 404 Not Found
#   class VideoNotFound < ClientError; end # :nodoc:
# 
#   # 5xx Server Error
#   class ServerError < ConnectionError; end # :nodoc:
# end