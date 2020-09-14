# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 10.times { Fabricate(:user).save }
# 10.times { Fabricate(:event).save }
# 10.times { Fabricate(:favourite).save }
# 10.times { Fabricate(:review).save }
# 10.times { Fabricate(:vote).save }
user = User.create! username: "singh.prd", email: "singh.prd@gmail.com", password: "password", password_confirmation: "password"
user = User.create! username: "p99rds", email: "p99rds@gmail.com", password: "password", password_confirmation: "password"
