# -*- encoding : utf-8 -*-
module ApplicationHelper

    
	def hide_overflow(text) 
         if text.length >= 40
         	text.slice(0,31)+"..."
         else
         	text
         end
    end

    def format_date date
    	date.strftime("%B %e, %Y")
    end


end
