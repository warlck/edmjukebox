# -*- encoding : utf-8 -*-
module ApplicationHelper

	def clean_title title
		title.split('/')[1].split('.mp3')[0]
	end

	def download_url_for(song_key)
		AWS::S3::S3Object.url_for(song_key, BUCKET, authenticated: false)
	end
end
