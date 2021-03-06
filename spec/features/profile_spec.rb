# -*- coding: utf-8 -*-
require File.expand_path('../../spec_helper', __FILE__)

feature 'profile settings' do
  given(:expected_flash) {
    I18n.t('flash.profiles.updated')
  }

  background do
    sign_in
  end

  background do
    visit profile_path
  end

  scenario "I update my profile" do
    fill_in 'profile_name',    with: 'shinebox'
    fill_in 'profile_website', with: 'http://shinebox.cn'
    fill_in 'profile_bio',     with: '**Launch your course now**'

    click_button '保存资料'

    expect(page).to have_content(expected_flash)
  end
end
