FactoryBot.define do
  factory :article, class: Article do
    title { 'Hello' }
    body { 'This is a first article' }
    status { 'public' }
    user
  end
end
