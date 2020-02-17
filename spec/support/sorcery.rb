module Sorcery
  module TestHelpers
    module Rails
      module Integration2
        def login_user_post(email, password)
          page.driver.post(user_sessions_url, email: email, password: password)
        end
      end
    end
  end
end
