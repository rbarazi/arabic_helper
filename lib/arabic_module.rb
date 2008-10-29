module RidaAlBarazi
  ActiveRecord::Errors.default_error_messages = {
    :inclusion => "ليس خيارا مقبولا",
    :exclusion => "محجوز",
    :invalid => "غير معرف أو محدد",
    :confirmation => "لا تتوافق مع التأكيد",
    :accepted => "يجب أن تقبل",
    :empty => "فارغ, نرجو ملء الحقل",
    :blank => "فارغ, نرجو ملء الحقل",
    :too_long => "أطول من اللازم (الحد الأقصى هو %d)",
    :too_short => "أقصر من اللازم (الحد الأدنى هو %d)",
    :wrong_length => "بطول غير مناسب (يجب أن يكون %d)",
    :taken => "غير متوفر (مستخد)",
    :not_a_number => "ليس رقما",
    :greater_than => "يجب أن يكون أكبر من %d",
    :greater_than_or_equal_to => "يجب أن يكون أكبر من أو يساوي %d",
    :equal_to => "يجب أن يساوي %d",
    :less_than => "يجب أن يكون أصغر من %d",
    :less_than_or_equal_to => "يجب أن يكون أصغرأو يساوي %d",
    :odd => "يجب أن يكون فردي",
    :even => "يجب أن يكون زوجي"
  }

  module ArabicModule
    # Define an Arabic name to each of the model attributes
    #
    # class Company < ActiveRecord::Base
    #   has_arabic_attributes :name => "الإسم",
    #                         :address => "العنوان"
    # end
    #
    #  Company.arabic_for(:name) # => "الإسم"
    def has_arabic_attributes(attributes={})
      class_inheritable_accessor :arabic_for
      self.arabic_for = attributes
      include RidaAlBarazi::ArabicModule::InstanceMethods
    end
    
    module InstanceMethods
      # Returns full Arabic error messages in an array.
      #
      # class Company < ActiveRecord::Base
      #   has_arabic_attributes :name => "الإسم",
      #                         :address => "العنوان"
      #   validates_presence_of :name, :address
      # end
      #
      #  company = Company.create
      #  company.arabic_full_messages # =>
      #   [ " العنوان فارغ, نرجو ملء الحقل" , " الإسم فارغ, نرجو ملء الحقل"]
      def arabic_full_messages
        messages = []

        self.errors.each do |attr, msg|
          next if msg.nil?

          case attr
          when "base" then messages << msg
          else messages << (self.class.arabic_for[attr.to_sym] || attr.to_s) + " " + msg
          end
        end
        messages.uniq
      end
    end
  end
end