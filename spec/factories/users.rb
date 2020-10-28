FactoryBot.define do
  factory :user do
    nickname              {"aaa"}
    last_name             {"山田"}
    first_name            {"五郎"}
    frigana_last          {"ヤマダ"}
    frigana_first         {"ゴロウ"}
    birthday              {"1999-01-01"}
    email                 {"aaa@gmail.com"}
    password              {"aaa000"}
    password_confirmation {"aaa000"}
  end
end