module RubocopAutomata
  module CI::Local
    module_function

    def repository_url
      "https://#{ENV['GITHUB_ACCESS_TOKEN']}@github.com/#{repository_name}"
    end

    def repository_name
      if ENV['AUTOMATA_REPOSITORY_NAME'].nil?
        raise 'Please input ENV of AUTOMATA_REPOSITORY_NAME'
      end
      ENV['AUTOMATA_REPOSITORY_NAME']
    end

    def base_branch
      if ENV['AUTOMATA_BASE_BRANCH'].nil?
        raise 'Please input ENV of AUTOMATA_BASE_BRANCH'
      end
      ENV['AUTOMATA_BASE_BRANCH']
    end

    def topic_branch
      @@topic_branch ||= "ci/auto_correction-#{Time.now.to_i}"
    end

    def pullrequest_title
      "rubocop --auto-correct at #{`echo -n $(date)`}"
    end

    def pullrequest_description
      <<~DESCRIPTION
        PR: https://github.com/#{repository_name}/pull/:id
        Auto generated by localhost
      DESCRIPTION
    end
  end
end
