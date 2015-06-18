class PagesController < ApplicationController
  def index
    # @repos = Repo.repos_needing_help_for_user(current_user)
    @repos = Repo.all
    @repos_subs = current_user.repo_subscriptions.page(params[:page]||1).per_page(params[:per_page]||50) if user_signed_in?
    @languages = []
    @repos.group_by(&:language).each do |lang|
      unless lang == nil
        @languages.push(lang)
      end
    end 
  end
end
