/// Pilot-study details for the DBT programme.
///
/// The programme is being run as a research pilot by Klára Pytelová
/// (Psychologický ústav, Filozofická fakulta, Masarykova univerzita) together
/// with Nepanikař. Participation has three parts: an entry questionnaire, the
/// seven weeks in the app, and an exit questionnaire after those seven weeks.
///
/// **No study data lives in this app, and none leaves it.** Both questionnaires
/// are Microsoft Forms on the university's tenant, so the informed consent,
/// whatever pairs someone's two questionnaires, and every answer stay with the
/// researcher. The app's entire part is two links.
///
/// It briefly did more. A participant number was stored and typed in, and the
/// programme could export a summary of someone's progress to send along; both
/// were dropped on 2026-09-20 in favour of the questionnaires alone. Worth
/// keeping that way: the moment the app holds any of this, Nepanikař is
/// carrying special-category health data about people with a BPD diagnosis,
/// which is a far heavier thing than a hyperlink.
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
/// Received 2026-09-20. Same tenant and same form family as the entry
/// questionnaire — only the form id differs — so a build that can reach one can
/// reach the other.
///
/// While this is empty the closing screen leaves the questionnaire out
/// entirely, rather than showing a button that goes nowhere.
const bpdResearchExitFormUrl =
    'https://forms.cloud.microsoft/pages/responsepage.aspx'
    '?id=I0-QEdvw3EyW9zkL1V_O6NQnBEJYjexFgDOdpuulVnFUQzQ0S0kyQlpQSjVJR0xRSDBDNlU3QklIMC4u'
    '&route=shorturl';

bool get hasBpdResearchExitForm => bpdResearchExitFormUrl.isNotEmpty;
