FactoryBot.define do
  factory :article do
    title { 'Hello' }
    body { 'This is a first article' }
    status { 'public' }
    user

    factory :arch_article do
      status { 'archived' }
    end

    factory :invalid_status do
      status { 'protected' }
    end
  end
end
