/// Pilot-study details for the DBT programme.
///
/// The programme is being run as a research pilot by Klára Pytelová
/// (Psychologický ústav, Filozofická fakulta, Masarykova univerzita) together
/// with Nepanikař. Participation has three parts: an entry questionnaire, the
/// seven weeks in the app, and an exit questionnaire after those seven weeks.
///
/// **No study data lives in this app.** Both questionnaires are Microsoft Forms
/// on the university's tenant, so the informed consent, the e-mail used to pair
/// someone's two questionnaires, and every answer stay with the researcher. The
/// app only links out. That is deliberate: the moment the app stored any of it,
/// Nepanikař would be holding special-category health data about people with a
/// BPD diagnosis, which is a far heavier thing to carry than a hyperlink.
library;

/// Entry questionnaire — informed consent plus the intake questions.
///
/// Also the consent step: the form's first question is the consent checkbox, so
/// someone who never opens this link has not consented to the study, only used
/// the app. The app cannot tell the difference, and does not try to.
const bpdResearchEntryFormUrl =
    'https://forms.cloud.microsoft/pages/responsepage.aspx'
    '?id=I0-QEdvw3EyW9zkL1V_O6NQnBEJYjexFgDOdpuulVnFUMjhUQUtKNjFBSVZVVzhVMjZIRkdRVlU3WS4u'
    '&route=shorturl';

/// The researcher's contact address, as given in the entry form.
const bpdResearchContactEmail = '510685@mail.muni.cz';

/// Exit questionnaire — the closing evaluation, shown after the last day of
/// Week 7.
///
/// **Empty until the researcher sends the link** (promised 2026-09-20). While
/// it is empty the closing screen simply leaves the questionnaire out, so a
/// build that ships without it has no dead button; filling this constant in is
/// the whole change.
const bpdResearchExitFormUrl = '';

bool get hasBpdResearchExitForm => bpdResearchExitFormUrl.isNotEmpty;
