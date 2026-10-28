/// Pilot-study details. Klára Pytelová (Psychologický ústav FF MUNI) with
/// Nepanikař: entry questionnaire, the seven weeks, exit questionnaire.
///
/// **No study data lives in this app.** Both questionnaires are Microsoft Forms
/// on the university's tenant; the app's whole part is two links. A stored
/// participant number and a progress export were dropped on 2026-09-20 — keep
/// it that way, or Nepanikař is holding health data about people with a
/// BPD diagnosis.
library;

/// Entry questionnaire, and the consent step — its first question is the consent
/// checkbox. Someone who never opens it has not consented, and the app cannot
/// tell the difference.
const bpdResearchEntryFormUrl =
    'https://forms.cloud.microsoft/pages/responsepage.aspx'
    '?id=I0-QEdvw3EyW9zkL1V_O6NQnBEJYjexFgDOdpuulVnFUMjhUQUtKNjFBSVZVVzhVMjZIRkdRVlU3WS4u'
    '&route=shorturl';

/// The researcher's contact address, as given in the entry form.
const bpdResearchContactEmail = '510685@mail.muni.cz';

/// Exit questionnaire, after the last day of Week 7 (received 2026-09-20). Same
/// tenant and form family as the entry one. While this is empty the closing
/// screen leaves the questionnaire out rather than showing a dead button.
const bpdResearchExitFormUrl =
    'https://forms.cloud.microsoft/pages/responsepage.aspx'
    '?id=I0-QEdvw3EyW9zkL1V_O6NQnBEJYjexFgDOdpuulVnFUQzQ0S0kyQlpQSjVJR0xRSDBDNlU3QklIMC4u'
    '&route=shorturl';

bool get hasBpdResearchExitForm => bpdResearchExitFormUrl.isNotEmpty;
