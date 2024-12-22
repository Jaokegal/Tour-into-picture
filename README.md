# TUM_Computer_Vision_Challenge

## Teammitglied:
- Dominik Wenzel,
- Hanqi Chen,
- Julian Egerer, 
- Junqing Du, 
- Xiaoyu Zhang, 
- Yuxuan Li.

## Dokumentation
Die funktionsspezifische Dokumentation kann durch den Befehl `help function` aufgerufen werden.

zum Beispiel:
help morph_to_rectangle
  This function maps a general quadrilateral in the input image, described by the points
  passed in poly onto a regularly shaped rectangle of dimension outputSize
  Input parameters:
  img: image from which the polygon shall be cropped
  poly: [x1, x2, ...; y1, y2, ...] array containing the nodes
  describing the polygon shape to be cropped
  outputSize: ["height", "width"] of the output rectangle
  Return value:
  morphedImg: image with the dimensions specified in outputSize

## Was kann man mit unseren APP machen?
Unsere App kann 2D-Bilder in beeindruckende 3D-Ansichten verwandeln. Klicken Sie einfach die Tasten in der richtigen Reihenfolge, wählen Sie den Vordergrund, den Fluchtpunkt und die Rückwand aus und beginnen Sie Ihre Reise ins Bild.

## Voraussetzungen
Das Programm setzt MATLAB 2023b und die Image Processing Toolbox voraus. Es läuft auf allen gängigen Betriebssystemen, die auch von MATLAB unterstützt werden.

## Nutzung der Gui
### Schritt 1
Öffnen Sie zunächst die Datei "main.m" und klicken Sie auf die Schaltfläche "Run". Sie können jetzt ein neues Fenster sehen.

### Schritt 2
Wählen Sie nun bitte das Bild aus. Sie können aus den in unserem System bereitgestellten Bildern wählen, oder Sie können Ihr eigenes Bild über den "browse..." auswählen.

### Schritt 3
Als nächstes werden Sie aufgefordert, einen Vordergrund auszuwählen. 

Drücken Sie zunächst "select voreground". Wenn sich der Mauszeiger in ein Kreuz verwandelt, können Sie so viele Punkte auf dem Bild klicken, wie Sie möchten, um den Vordergrund einzuschließen. Klicken Sie während des Vorgangs nacheinander auf jeden Punkt. Nachdem Sie den letzten Punkt ausgewählt haben, kehren Sie zum Ausgangspunkt zurück und klicken, wenn sich der Mauszeiger in einen Kreis verwandelt, um den Auswahlbereich für den Vordergrund zu definieren. 

Wenn das Bild keinen Vordergrund hat, können Sie "select voreground" nicht anklicken.

### Schritt 4
Als nächstes wählen Sie bitte den Fluchtpunkt und die Rückwand aus.

Klicken Sie zunächst auf "select vanishing point". Wenn sich der Zeiger in ein Kreuz verwandelt, klicken Sie einmal auf den gewünschten Position vom Fluchtpunkt im Bild. Eine Rückwand und vier radiale Linien werden automatisch um den Fluchtpunkt herum erstellt. Sie können den Fluchtpunkt und die Rückwand verschieben, indem Sie mit der Maus darüber fahren, oder ihre Größe ändern, bis Sie zufrieden sind.

Für einen besseren 3D-Effekt empfiehlt es sich, die radialen Linie an den Fluchtlinien des Bildes auszurichten.

Klicken Sie auf "reset", um die Seite zurückzusetzen.

### Schritt 5
Wenn die Lage des Fluchtpunkts und der Rückwand bestimmt wurde, klicken Sie auf "confirm".

Im erscheinenden Pop-up-Fenster können Sie die gewünschte Höhe der realen Wand und die gewünschte Tiefe des Bildes einstellen. Klicken Sie auf "Ok", um mit dem nächsten Schritt fortzufahren.

### Schritt 6
Sie sehen das Bild jetzt in 3D-Ansicht. Bitte klicken Sie zunächst irgendwo auf das Bild. 

Dann können Sie die Kamera vorwärts, rückwärts, links und rechts bewegen, indem Sie die Taste ""w"" "s" "a" "d" auf Ihrer Tastatur drücken. Mit der Taste "↑" "↓" "←" "→" auf der Tastatur ändern Sie die Ansicht der Kamera nach oben, unten, links und rechts. "q" und "e" drehen die Kamera jeweils nach links und rechts um die Mittelachse.

Wenn Ihr Bild zu weit verschoben ist, können Sie die Position der Kamera mit "Reset" wiederherstellen.

### Zusätzliche Schritte
Wenn Sie mit dem Effekt nicht zufrieden sind und die Position des Fluchtpunkts und der realen Wand ändern möchten, können Sie auf "Back" klicken, um zur vorherigen Seite zurückzukehren und Änderungen vorzunehmen. Klicken Sie auf "confirm", um wieder zur 3D-Ansicht zurückzukehren.



