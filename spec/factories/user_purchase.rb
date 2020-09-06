FactoryBot.define do
  factory :user_purchase do
    token               {"1111"}
    post_code           {"123-4567"}
    ship_to_region_id   {1}
    city                {"aaa"}
    block               {"sss"}
    building            {"xxx"}
    phone_number        {"09012345678"}
  end
end