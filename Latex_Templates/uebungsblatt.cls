%=====================================================================================================================================
% Class uebungsblatt by Igor Akkerman (c)2004,2005,2006
% Modification by Maria Kosche (c)2020
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License (latest version).
%
% The latest version of this license can be found at
%     http://www.latex-project.org/lppl.txt
%=====================================================================================================================================
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{uebungsblatt}[2006/10/24 by Igor Akkerman (c)2004,2005,2006 v1.5.0 Klasse zum Setzen von Uebungsblaettern edited by Maria Kosche (c)2020]
%=====================================================================================================================================

% Dokumentklassen-Optionen:
%     aufgeqno - In Gleichungsnummern soll die Aufgabennummer auftauchen (<Aufgabennummer>.<Gleichungsnummer>)
%     fleqn    - Gleichungen werden nicht zentriert sondern linksbündig angezeigt
%     leqno    - Gleichungsnummern werden nicht rechts sondern links von der Gleichung angezeigt
%     10pt     - Schriftgröße: 10pt (Standard)
%     11pt     - Schriftgröße: 11pt
%     12pt     - Schriftgröße: 12pt

%--------------------------
% \begin{aufgabe} ... \end{aufgabe}
% Aufgabe
%--------------------------

%--------------------------
% \begin{aufgabe*}{<aufgabentitel>} ... \end{aufgabe*}
% Aufgabe mit ergänzendem Titel <aufgabentitel>
%--------------------------
% Der Aufgabenzähler wird NICHT erhöht!
%--------------------------

% -------------------------------
% Lehrveranstaltungsinformationen
% -------------------------------
% Um Lehrveranstaltungsinformationen, die sich von Blatt zu Blatt derselben
% Lehrveranstaltung nicht verändern, nicht in jede Datei eintragen zu müssen.
% Es wird automatisch versucht, die Datei "lv.tex" zu laden, die Angaben zur
% Lehrveranstaltung enthalten kann (Name der LV, Namen der Gruppenmitglieder usw.)
% Die Datei wird zuerst im aktuellen Verzeichnis gesucht. Wird sie dort nicht
% gefunden, wird sie im uebergeordneten Verzeichnis gesucht. Danach wird die
% Suche abgebrochen.
%--------------------------

%--------------------------
% \header{<header>}
% Setzt den Header auf <header>.
% Zum Zeilenumbruch wird \\ verwendet.
% Default: {}
%--------------------------

%--------------------------
% \blatttitel{<titel>}
% Setzt den Blatttitel auf <titel>.
% Zum Zeilenumbruch wird \\ verwendet.
% Der Titel wird bei Beginn des Übungsblatts verwendet.
% Default: Bearbeitung des \theblatt.~Übungsblatts
%--------------------------

%--------------------------
% \blattnummer{<nummer>}
% Setzt den Wert des Zählers blatt auf <nummer>.
%--------------------------

%--------------------------
% \abgabedatum{<abgabedatum>}
% Setzt das Abgabedatum auf <abgabedatum>.
% Das Abgabedatum wird bei der Abgabeinfo verwendet.
% Default: {}
%--------------------------

%--------------------------
% \abgabeinfo{<abgabeinfo>}
% Setzt die Abgabeinfo auf <abgabeinfo>.
% Die Abgabeinfo wird unterhalb des Blatttitels ausgegeben.
% Default: Abgabe bis \@abgabedatum.
%--------------------------

%--------------------------
% \lernmodul{<lernmodul>}
% Setzt das Lernmodul auf <lernmodul>.
% Das Lernmodul wird unterhalb der Abgabeinfo ausgegeben.
% Hier können Angaben über das zugehörige ILIAS-Lernmodul gemacht werden oder ähnliches.
% Default: {}
%--------------------------

%--------------------------
% \introtext{<introtext>}
% Setzt den Introtext auf <introtext>.
% Der Introtext wird unterhalb des Lernmodul ausgegeben.
% Hier können diverse Hinweise zur Abgabe angegeben werden.
% Default: {}
%--------------------------

%--------------------------
% \ifinhead{<danntext>}{<sonsttext>}
% <danntext> im inhead-Modus; <sonsttext> sonst
%--------------------------

%--------------------------
% \aufgabelabel{<labelmuster>}
% Setzt das Label der Aufgaben auf <labelmuster>.
% <labelmuster> ist ein Muster wie definiert im Paket counterlabelpattern.
%--------------------------

%--------------------------
% \loseunglabel{<loesunglabel>}
% Setzt das Label der Lösungen auf <loesunglabel>.
% Default: Lösung.
%--------------------------

% -----------------
% definierte Zähler
% -----------------
% uebungsblatt : Nummer des Übungsblatts
%                Die Nummer wird automatisch bestimmt aus dem Dateinamen der Hauptdatei.
%                Dazu muss der Dateiname mit der Blattnummer beginnen.
%                (Vorsicht bei Leerzeichen: Der Dateiname könnte mit Anführungszeichen beginnen.)
% aufgabe      : Nummer der aktuellen Aufgabe

%=====================================================================================================================================

% Initialisierungsteil
\RequirePackage{ifthen}
\newboolean{aufgeqno}

\AtBeginDocument{%
    \@header%
    % Aufgabennummer zurücksetzen
    \addtocounter{aufgabe}{-1}%
    \vspace*{2\baselineskip}%
    \par%
    \hspace*\fill\begin{Large}\textbf{\@blatttitel}\end{Large}\hspace*\fill%
    \ifset{\@blattuntertitel}{%
        \\[.5\baselineskip]%
        \hspace*\fill\begin{large}\textbf{\@blattuntertitel}\end{large}\hspace*\fill%
    }%
    \vspace*{2\baselineskip}%
    \par%
    \ifset{\@abgabedatum}{%
        \textbf{\@abgabeinfo}\hspace*\fill%
    }
    \ifset{\@lernmodul}{%
        \\ \textbf{\@lernmodul}\hspace*\fill%
    }
    \par%
    \@introtext%
    \par%
}

\AtEndDocument{%
    \label{lastpage}%
}

% Deklaration von Optionen
\DeclareOption {aufgeqno} {\setboolean{aufgeqno}{true}}%
\DeclareOption {10pt}     {\PassOptionsToClass{10pt}{akktecdoc}}%
\DeclareOption {11pt}     {\PassOptionsToClass{11pt}{akktecdoc}}%
\DeclareOption {12pt}     {\PassOptionsToClass{12pt}{akktecdoc}}%

% Ausfuehrung von Optionen
\ProcessOptions

% Laden von Paketen
\LoadClass[widepage,longpage]{akktecdoc}
\RequirePackage{uebungsblatt}
\ifthenelse{\boolean{aufgeqno}} {%
    \RequirePackage{amsmath}%
    % Nummerierung der Gleichungen: (<Nr. der Aufgabe>.<Nr. der Gleichung>)
    \numberwithin{equation}{aufgabe}%
}{}

% -----------------
% Initialisierungen
% -----------------

% Seiteneinstellungen
\pagestyle{plain}

% Defaultwerte
\blatttitel{Bearbeitung des \theblatt.~\"Ubungsblatts}
\header{}
\aufgabelabel{{Aufgabe }1}
\loesunglabel{L\"osung.}
\abgabedatum{}
\abgabeinfo{Abgabe bis \@abgabedatum.}
\lernmodul{}
\introtext{}

% Bestimmen der Übungsblatt-Nummer
%\extractnumber \jobname {blatt}
%\typeout{[uebungsblatt] Dateiname: \jobname}
%\typeout{[uebungsblatt] Uebungsblattnummer: \theblatt}

% Laden der Datei lv.tex
\typeout{[uebungsblatt] Suche Datei 'lv.tex'}
\InputIfFileExists {lv.tex} {
    \typeout{[uebungsblatt] Datei 'lv.tex' in aktuellem Verzeichnis gefunden. Datei wird geladen.}
}
{
    \InputIfFileExists {../lv.tex} {
        \typeout{[uebungsblatt] Datei 'lv.tex' in übergeordnetem Verzeichnis gefunden. Datei wird geladen.}
    }
    {
        \typeout{[uebungsblatt] Datei 'lv.tex' nicht gefunden.}
    }
}
