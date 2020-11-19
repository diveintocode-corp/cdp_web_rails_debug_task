FactoryBot.define do
  factory :blog do
    id {1}
    title { 'Factoryで作ったデフォルトのタイトル１' }
    content { 'Factoryで作ったデフォルトのコンテンツ１' }
  end

  # factory :second_task, class: Task do
  #   title { 'Factoryで作ったデフォルトのタイトル２' }
  #   content { 'Factoryで作ったデフォルトのコンテント２' }
  # end
end
