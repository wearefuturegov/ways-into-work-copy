class PersonalTraitOption < Option
  def self.all # rubocop:disable  Metrics/AbcSize, Metrics/MethodLength
    [
      new('creative', I18n.t('clients.personal_trait.creative')),
      new('active', I18n.t('clients.personal_trait.active')),
      new('caring', I18n.t('clients.personal_trait.caring')),
      new('organised', I18n.t('clients.personal_trait.organised')),
      new('problem_solver', I18n.t('clients.personal_trait.problem_solver')),
      new('people_person', I18n.t('clients.personal_trait.people_person')),
      new('persuasive', I18n.t('clients.personal_trait.persuasive')),
      new('good_listener', I18n.t('clients.personal_trait.good_listener')),
      new('outgoing', I18n.t('clients.personal_trait.outgoing'))
    ]
  end
end
