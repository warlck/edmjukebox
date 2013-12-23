# -*- encoding : utf-8 -*-
module ApplicationHelper

	def clean_title title
		title.split('/')[1].split('.mp3')[0]
	end


	def hide_overflow(text) 
         if text.length >= 40
         	text.slice(0,31)+"..."
         else
         	text
         end
    end

    def format_date date
    	date.strftime("%B %e %Y")
    end


end
