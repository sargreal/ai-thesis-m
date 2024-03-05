- Hierachy of executed tasks and methods
- Analyze Resource Allocation
- Input of Expected Tasks
- ActionInsertion of Commonly Required tasks
- Resource driven Action scheduling? 


- Baseline: Random aufgabe auswählen die eingefügt wird
- Planungsproblem in QCN übersetzen, Aufgaben einfügen und auf robustheit prüfen
- Eventuell nicht ins QCN, sondern Metriken direkt im CN

- Robustheit eventuell nicht sehr sinnvoll, weil nur einfügen kleiner Tasks wenig Robustheit verändert, größere Aufgaben wie chop würden nicht eingefügt werden


Metriken:
- Makespan
- Success Rate
- Deadline Oriented
- Qualitative Analyse?



reversibility sackgasse und anticipatorisch

## Diskussionen und Ergebnisse nach der Vorstellung:

### Optimierungen

- Heuristik für Robustheit:
  - möglicherweise hacky
  - wie kann MetaCSP von Fape dementsprechend analysiert werden?
  - wie können die constraints im SimpleTemporalNetwork analysiert werden?
  - Wie hilft die Heuristik wenn wir weiterhin einen BestFirst Ansatz fahren?
  - Möglicherweise nicht umsetzbar wie bei QCNs:
    - STNs (simple temporal networks) haben keine mehreren möglichkeiten, sind immer ein refinement/scenario. Haben auch int variablen in den constraints ( x + d >= z ) -> pertubations nicht wirklich möglich?
      - Pertubation als Verschiebung von Zeitpunkten nach hinten
      - Maß für Robustheit abhängig von maximal möglicher temporaler Verschiebung?
    - Variable Bindings haben Alternativen, sind aber nicht direkt in einem Kalkulus (?), sondern haben lediglich die constraints: =,(!=)?,∈ (und >,< für int variablen)
    - Robustness in CSPs anschauen! -> Lösung für Robustheit ist meistens Puffer einzubauen, was nicht unbedingt unser ziel ist, da delays an sich kein problem sind, solange sie nicht über die gesamte deadline hinaus gehen
      - Variante 1: Übertragung in Weighted CSP, Lösung durch WCSP Solver -> Relaxiert die Aufgaben hauptsächlich mit etwas zwischenzeit. Vermutlich keine Robustheit gegenüber hinzugefügten aufgaben?
        -> Evtl Problematischer Ansatz weil wenig zitiert, low impact factor journal und viele grammatik Fehler
      - Variante 2: Robustness in Model Predictive Control -> Genauer Ansatz noch unklar, ziel aber ähnlich zu Variante 1
- Einfügen von Vorbereitungen:
  - Es gibt keine direkte möglichkeit zu sagen welcher Task genau sinnvoll ist vorzubereiten, oder welche Fluents dafür relevant sind
  - Was passiert wenn durch eingefügte Vorbereitungen Sackgassen entstehen (z.b. Kein Platz zum schneiden oder Servieren)
  - Eingefügte Aufgaben sollten Rückgangig gemacht werden können (z.b. geschnittenen Salat wegschmeißen)?
  - Entstehen überhaupt Sackgassen, sind sie überhaupt verhinderbar?
  - Optimierung hin zu maximaler Auslastung? Ähnlich wie bei Sprint Planung?

### Generelle Anmerkungen & Diskussionen

Robustheit:
- Was passiert wenn Aufgaben fehlschlagen? Hauptsächlich relevant in Diskussion und Outlook
- Was passiert wenn Planung fehlschlägt?
  - Soll wie im Spiel einfach penalty gegeben werden?
  - Oder bricht die Planung einfach ab?

Feld Cognitive Robotics:
- Wie wird dort mit neuen Tasks umgegangen?
- Wie wird dort mit Robustheit umgegangen?

Generell mehr Fokus auf reale Anwendungsszenarien, bzw auf die Übertragbarkeit eingehen: 
  - echte Restaurant-Küche
  - Lieferplanung (siehe z.B. Airlift Challenge)
  - automatische Aufgabenplanung in z.B. Scrum
