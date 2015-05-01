module Admin::PostsHelper
	def convert_raw_content(raw_content)
		raw_content.gsub("\r\n", "\r")
	end
end
