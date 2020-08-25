FactoryBot.define do
  factory :user do
    nickname                  {"山田太郎"}
    email                     {"kkk@gmail.com"}
    password                  {"a12345"}
    password_confirmation     {password}
    last_name                 {"太郎"}
    first_name                {"山田"}
    last_name_kana            {"タロウ"}
    first_name_kana           {"ヤマダ"}
    birthday                  {"1980-01-01"}
  end
end