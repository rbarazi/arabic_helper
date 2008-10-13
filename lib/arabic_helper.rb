module RidaAlBarazi       
  module ArabicHelper
    ARABIC_COUNTRIES = ["آيسلندا", "أذربيجان", "أرمينيا", "أروبه", "أستراليا", "أفغانستان", "ألبانيا", "ألمانيا", "أنتاركتيكا", "أندونيسيا", "أنغولا", "أورغواي", "أوزباكستان", "أوغندا", "أوكرانيا", "إريتريا", "إسبانيا", "إسرائيل", "إكوادور", "إلسلفادور", "إيران", "إيرلندا", "إيطاليا", "استونيا", "الأردن", "الإمارات العرب", "الباهاماس", "البحرين", "البرازيل", "البرتغال", "البوسنة و الهرسك", "الجزر العذراء الأمريكي", "الجزر العذراء البريطانية", "الجمهورية التشيكية", "الجمهوريةالدومينيكية", "الدانمارك", "الرأس الأخضر", "السنغال", "السودان", "السويد", "الصحراء الغربية", "الصومال", "العراق", "الغابون", "الفاتيكان", "الفليبين", "الكويت", "المالديف", "المجر", "المغرب", "المكسيك", "المملكة العربية السعودية", "المملكة المتحدة", "المناطق", "النرويج", "النمسا", "النيجر", "الهند", "اليابان", "اليمن", "اليونان", "بابوا غينيا الجديدة", "باراغواي", "باكستان", "بالاو", "بربادوس", "بروني", "بلجيكا", "بلغاريا", "بنغلاديش", "بنما", "بنين", "بوتان", "بوتسوانا", "بورتوريكو", "بوركينا فاسو", "بوروندي", "بولونيا", "بوليفيا", "بولينيزياالفرنسية", "بيرو", "بيليز", "تايلندا", "تايوان", "تبت", "تركمانستان", "تركيا", "ترينيداد وتوباغو", "تشاد", "تنزانيا", "توغو", "توفالو", "تونس", "تونغا", "تيمور الشرقية", "تيمور الشرقية", "جبل طارق", "جرينلاند", "جزر الأنتيل الهولندي", "جزر القمر", "جزر برمودا", "جزر سليمان", "جزر فارو", "جزر كوك", "جزر ماريانا الشمالية", "جزرجوادلوب", "جزرمارشال", "جمايكا", "جمهورية الصين الشعبية", "جمهوريةأفريقيا الوسطى", "جمهوريةالكونغو", "جمهوريةالكونغو الديمقراطية", "جنوب أفريقيا", "جوام", "جيبوتي", "جيورجيا", "دومينيكا", "رواندا", "روسيا", "روسيا البيضاء", "رومانيا", "زامبيا", "زمبابوي", "ساحل العاج", "ساموا-الأمريكي", "سان مارينو", "سانت فنسنت وجزر غرينادين", "سانت كيتس ونيفس", "سانت لوسيا", "ساو تومي وبرينسيبي", "سريلانكا", "سلوفاكيا", "سلوفينيا", "سنغافورة", "سوازيلند", "سوريا", "سورينام", "سويسرا", "سيراليون", "سيشيل", "شيلي", "طاجيكستان", "عُمان", "غامبيا", "غانا", "غرينادا", "غواتيمال", "غويانا الفرنسية", "غيانا", "غينيا", "غينيا الاستوائي", "غينيا-بيساو", "فانواتو", "فرنسا", "فلسطين", "فنزويلا", "فنلندا", "فيتنام", "فيجي", "قبرص", "قطر", "قيرغيزستان", "كازاخستان", "كاليدونيا الجديدة", "كاميرون", "كرواتيا", "كمبوديا", "كندا", "كوبا", "كوريا الجنوبية", "كوريا الشمالية", "كوستاريكا", "كولومبيا", "كيريباتي", "كينيا", "لاتفيا", "لاوس", "لبنان", "لتوانيا", "ليبيا", "ليبيريا", "ليختنشتين", "ليسوتو", "مارتينيك", "ماكاو", "مالطا", "مالي", "ماليزيا", "مدغشقر", "مصر", "مقدونيا", "منغوليا", "موريتانيا", "موريشيوس", "موزمبيق", "مولدافيا", "موناكو", "مونتسيرات", "ميانمار", "ناميبيا", "نورو", "ني", "نيبال", "نيجيريا", "نيكاراجوا", "نيوزيلندا", "هايتي", "هندوراس", "هولندا", "هونغ كونغ"]
    PRIORITY_COUNTRIES =["الأردن", "الإمارات العربية المتحدة", "البحرين", "السودان", "الصومال", "العراق", "الكويت", "المغرب", "المملكة العربية السعودية", "اليمن", "تونس", "سوريا", "عُمان", "فلسطين", "قطر", "ليبيا", "مصر", "موريتانيا"]

    # Returns a string of option tags for most countries in the world in Arabic.
    #
    # NOTE: Only the option tags are returned, you have to wrap this call in a regular HTML select tag.
    def arabic_country_options_for_select(selected = nil, priority_countries = nil)
      country_options = options_for_select(ARABIC_COUNTRIES, selected)
    
      if priority_countries
        country_options = options_for_select(PRIORITY_COUNTRIES, selected)
        country_options += "<option value=\"\" disabled=\"disabled\">-------------</option>\n"
        country_options += options_for_select((ARABIC_COUNTRIES-PRIORITY_COUNTRIES), selected)
      end
      return country_options
    end

    # Return select and option tags for the given object and method, using country_options_for_select 
    # to generate the list of option tags.
    def arabic_country_select(object, method, priority_countries = nil, options = {}, html_options = {})
      countries = ARABIC_COUNTRIES
      if priority_countries
        countries = PRIORITY_COUNTRIES+["-------------"]+(countries-PRIORITY_COUNTRIES)
      end
      ActionView::Helpers::InstanceTag.new(object, method, self, nil, options.delete(:object)).to_select_tag(countries, options, html_options)
    end

    # Like arabic_distance_of_time_in_words, but where to_time is fixed to Time.now. 
    def arabic_time_ago_in_words(from_time, include_seconds = false)
      arabic_distance_of_time_in_words(from_time, Time.now, include_seconds)
    end

    # Reports the approximate distance in time between two Time or Date objects or integers as seconds in Arabic.
    # Set <tt>include_seconds</tt> to true if you want more detailed approximations when distance < 1 min, 29 secs
    # Distances are reported based on the following table:
    #
    #   0 <-> 29 secs                                                             # => أقل من دقيقة
    #   30 secs <-> 1 min, 29 secs                                                # => دقيقة واحدة
    #   1 min, 30 secs <-> 2 mins, 29 secs                                        # => دقيقتان
    #   2 min, 30 secs <-> 10 mins, 29 secs                                       # => [2..10] دقائق
    #   10 min, 30 secs <-> 44 mins, 29 secs                                      # => [11..44] دقيقة
    #
    # With <tt>include_seconds</tt> = true and the difference < 1 minute 29 seconds:
    #   0-4   secs      # => أقل من ٥ ثوان
    #   5-9   secs      # => أقل من ١٠ ثوان
    #   10-19 secs      # => أقل من ٢٠ ثانية
    #   20-39 secs      # => أقل من ٢٠ ثانية
    #   40-59 secs      # => نصف دقيقة
    #   60-89 secs      # => دقيقة واحدة
    #
    # ==== Examples
    #   from_time = Time.now
    #   arabic_distance_of_time_in_words(from_time, from_time + 50.minutes)        # => حوالي ساعة
    #   arabic_distance_of_time_in_words(from_time, 50.minutes.from_now)           # => حوالي ساعة
    #   arabic_distance_of_time_in_words(from_time, from_time + 15.seconds)        # => أقل من دقيقة
    #   arabic_distance_of_time_in_words(from_time, from_time + 15.seconds, true)  # => أقل من ٢٠ ثانية
    #   arabic_distance_of_time_in_words(from_time, 3.years.from_now)              # => حوالي 3 سنوات
    #
    #   to_time = Time.now + 6.years + 19.days
    #   arabic_distance_of_time_in_words(from_time, to_time, true)     # => حوالي 6 سنوات
    #   arabic_distance_of_time_in_words(to_time, from_time, true)     # => حوالي 6 سنوات
    #   arabic_distance_of_time_in_words(Time.now, Time.now)           # => أقل من دقيقة
    #
    def arabic_distance_of_time_in_words(from_time, to_time = 0, include_seconds = false)
      from_time = from_time.to_time if from_time.respond_to?(:to_time)
      to_time = to_time.to_time if to_time.respond_to?(:to_time)
      distance_in_minutes = (((to_time - from_time).abs)/60).round
      distance_in_seconds = ((to_time - from_time).abs).round

      case distance_in_minutes
        when 0..1
          return (distance_in_minutes == 0) ? 'أقل من دقيقة' : 'دقيقة واحدة' unless include_seconds
          case distance_in_seconds
            when 0..4   then 'أقل من ٥ ثوان'
            when 5..9   then 'أقل من ١٠ ثوان'
            when 10..19 then 'أقل من ٢٠ ثانية'
            when 20..39 then 'نصف دقيقة'
            when 40..59 then 'أقل من دقيقة'
            else             'دقيقة واحدة'
          end

        when 2                then "دقيقتان"
        when 3..10            then "#{distance_in_minutes} دقائق"
        when 11..44           then "#{distance_in_minutes} دقيقة"
        when 45..89           then 'حوالي ساعة'
        when 90..149          then "حوالي ساعتين"
        when 150..629         then "حوالي #{(distance_in_minutes.to_f / 60.0).round} ساعات"
        when 630..1439        then "حوالي #{(distance_in_minutes.to_f / 60.0).round} ساعة"
        when 1440..2159       then 'يوم واحد'
        when 2160..3599       then 'يومين'
        when 3600..15119      then "#{(distance_in_minutes / 1440).round} أيام"
        when 15120..43199     then "#{(distance_in_minutes / 1440).round} يوما"
        when 43200..86399     then 'حوالي شهر واحد'
        when 86400..128159    then 'حوالي شهرين'
        when 128160..475199   then "#{(distance_in_minutes / 43200).round} أشهر"
        when 475200..525599   then "#{(distance_in_minutes / 43200).round} شهرا"
        when 525600..1051199  then 'حوالي سنة واحدة'
        when 1051200..1576799 then 'حوالي سنتين'
        when 1576800..5781599 then "حوالي #{(distance_in_minutes / 525600).round} سنوات"
        else                       "أكثر من #{(distance_in_minutes / 525600).round} سنة"
      end 
    end

    # Attempts to pluralize the singular word unless count is 1.
    # It will use <tt>singular</tt> for the count of 1 or more than 10
    # It will use <tt>double</tt> for the count of 2
    # It will use <tt>plural</tt> for the count of 3 to 10 and for 0 
    def arabic_pluralize(number, singular, double, plural, gender_class='male')
      one = gender_class == 'male' ? 'واحد' : 'واحدة'
      case number
        when 0     then "لا #{plural}"
        when 1     then "#{singular} #{one}"
        when 2     then "#{double}"
        when 3..10 then "#{number} #{plural}"
        else            "#{number} #{singular}"
      end
    end
  end
end