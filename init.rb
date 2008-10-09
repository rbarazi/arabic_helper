require 'arabic_helper'
require 'arabic_module'
ActiveRecord::Base.send(:extend, RidaAlBarazi::ArabicModule)
ActionView::Base.send(:include, RidaAlBarazi::ArabicHelper)