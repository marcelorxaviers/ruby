module ZohoWrapper
  module ActiveRecord

    def zoho_save
      logger.info 'Saving #{fullname} to zoho'

      begin
        setup_zoho
        raise "Missing zoho_token" if self.respond_to? :zoho_lead=
        lead = RubyZoho::Crm::Lead.new(self.zoho_lead.dup)
        lead.save
        self.on_zoho = true
        self.save!
      rescue Exception => exception
        logger.error(
          "<Error while trying to SAVE new lead at zoho> \n" +
          "#{exception.class} (#{exception.message})")
        return false
      end
    end

    def zoho_remove
      logger.info 'Removing #{fullname} from zoho'

      begin
        setup_zoho
        leads = RubyZoho::Crm::Lead.find_by_email(self.email)
        for lead in leads
          RubyZoho::Crm::Lead.delete(lead.id)
        end
        self.on_zoho = false
        self.save!
      rescue Exception => exception
        logger.error(
          "<Error while trying to REMOVE lead at zoho> \n" +
          "#{exception.class} (#{exception.message})")
        return false
      end
    end

    private
    def setup_zoho
      raise "Missing zoho_token" if self.respond_to? :zoho_token=
      RubyZoho.configure do |config|
          # 'ed7fc5b8a28a358793dcd162e67c43e1'
          config.api_key = self.zoho_token
      end
    end
  end
end