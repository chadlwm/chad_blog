module Admin::PostsHelper
	def convert_raw_content(raw_content)
		return raw_content if raw_content.blank?
		raw_content.gsub("\r\n", "\r")
	end
end
