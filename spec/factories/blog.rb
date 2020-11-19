FactoryBot.define do
  factory :blog do
    id {1}
    title { 'Factoryで作ったデフォルトのタイトル１' }
    content { 'Factoryで作ったデフォルトのコンテンツ１' }
  end
end
