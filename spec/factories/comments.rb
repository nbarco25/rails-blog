FactoryBot.define do
  factory :comment do
    body { 'Cooool, great article ' }
    status { 'public' }
    commenter { 'yo' }
    user
    article

    factory :private_comment do
      status { 'private' }
    end

    factory :archived_comment do
      status { 'archived' }
    end
  end
end
