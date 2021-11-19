FactoryBot.define do
  factory :comment, class: Comment do
    body { 'Cooool, great article '}
    status { 'public' }
    user
    article
  end
end
