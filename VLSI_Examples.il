; "Author": Dr. Shayan (Sean) Taheri.
; "File Content": "VLSI-related functions" written in the Cadence SKILL Language.
; In the Cadence SKILL Language, the semicolon is used to indicate a comment.
; Everything after the semicolon, on the same line, is treated as a comment and is ignored by the interpreter.
; The SKILL language script typically starts with function definitions and ends with function calls.
; Within a file, you can have any number of function definitions, variable declarations, and expressions.
; SKILL files typically have the ".il" extension, which stands for "interpreted language".
; If you were to save a SKILL script, it might be named something like "myscript.il".

; Open a Library:
(defun open-lib (libName)
  (dbOpenCellViewByType libName "top" "schematic" 'read))

; List All Instances in a Cell:
(defun list-instances (cell)
  (dbGetInstances cell))

; List All Nets in a Cell:
(defun list-nets (cell)
  (dbGetNets cell))

; Check if Library Exists:
(defun lib-exists? (libName)
  (member libName (dbListLibs)))

; Create a New Library:
(defun create-lib (libName)
  (dbCreateLib libName))

; Close a Library:
(defun close-lib (lib)
  (dbClose lib))

; Open a Cell View:
(defun open-cell (lib cell view)
  (dbOpenCellView lib cell view 'read))

; Open a Cellview by Type:
(defun open-cellview-type (lib cell view)
  (dbOpenCellViewByType lib cell view "r"))

; List All Pins of an Instance:
(defun list-pins (inst)
  (dbGetPins inst))

; Get Number of Pins in a Cell:
(defun get-pin-count (lib cell)
  (let ((theCell (dbOpenCellViewByType lib cell "layout" "maskLayout")))
    (length (dbGetPins theCell))))

; List All Terminals in a Cell:
(defun list-terminals (cell)
  (dbGetTerminals cell))

; List All Cells in a Library:
(defun list-cells (lib)
  (dbGetCellNames lib))

; Detailed Listing All Cells in a Library:
(defun list-all-cells (lib)
  (let (cells)
    (mapcar
      (lambda(cell)
        (setq cells (cons cell cells)))
      (dbGetCellNames lib))
    cells))

; List All Views of a Cell:
(defun list-views (lib cell)
  (dbGetCellViews lib cell))

; Close a Cell View:
(defun close-cell (cv)
  (dbClose cv))

; List All Instances in a Cell View:
(defun list-instances-cv (cv)
  (mapcar 'dbGetInstName (dbGetInsts cv)))

; List All Nets in a Cell View:
(defun list-nets-cv (cv)
  (mapcar 'dbGetNetName (dbGetNets cv)))

; Delete a Library:
(defun delete-lib (libName)
  (dbDeleteLib libName))

; Copy a Cell to Another Library:
(defun copy-cell-to-lib (srcLib destLib cellName viewName)
  (dbCopyCellView srcLib cellName viewName destLib cellName viewName))

; List All Pins of a Cell View:
(defun list-pins-cv (cv)
  (mapcar 'dbGetPinName (dbGetPins cv)))

; Find the Bounding Box of a Cell View:
(defun get-bbox (cv)
  (dbGetBoundBox cv))

; List All Libraries in the Environment:
(defun list-libs ()
  (dbListLibs))

; Rename a Cell:
(defun rename-cell (lib old-cell-name new-cell-name)
  (dbRenameCell lib old-cell-name new-cell-name))

; List All Layers in a Technology File:
(defun list-tech-layers (tech)
  (techGetLayerNames tech))

; Detailed List All Layers in a Technology File:
(defun list-all-layers ()
  (mapcar 
    (lambda (layer) (techGetLayerName layer))
    (techGetLayerList)))

; Get Layer Number by Name:
(defun get-layer-number (layerName)
  (techLayerNum layerName))

; Print Layers from a Technoloy File:
(defun print-all-layers ()
  (foreach layer (techGetLayerList)
    (println (techGetLayerName layer))))

; Get the Area of an Instance:
(defun get-inst-area (inst)
  (* (car (dbGetBox inst)) (cadr (dbGetBox inst))))

; Get the Width of an Instance:
(defun get-inst-width (inst)
  (car (dbGetBox inst)))

; Get the Height of an Instance:
(defun get-inst-height (inst)
  (cadr (dbGetBox inst)))

; List All Terminals of a Cell View:
(defun list-terminals-cv (cv)
  (mapcar 'dbGetTermName (dbGetTerms cv)))

; Extract Netlist of a Cell View:
(defun extract-netlist (cv)
  (schExtractNetlist cv))

; Flatten a Hierarchical Cell View:
(defun flatten-hierarchy (cv)
  (dbFlattenHierarchy cv))

; Replace an Instance in a Cell View:
(defun replace-inst (cv inst-name new-lib new-cell new-view)
  (dbReplaceInst (dbOpenCellView cv 'layout) inst-name new-lib new-cell new-view))

; Get the Area of a Cell View:
(defun get-cell-area (cv)
  (let ((bbox (get-bbox cv)))
    (* (car bbox) (cadr bbox))))

; Create a New Pin in a Cell View:
(defun add-pin (cv pin-name layer)
  (dbCreatePin cv pin-name layer 'input))

; Export a Cell View to GDSII:
(defun export-gds (cv file-name)
  (dbOutGds cv file-name))

; Import a GDSII into a Library:
(defun import-gds (lib file-name)
  (dbInGds lib file-name))

; Change Cell View Origin:
(defun set-origin (cv x y)
  (dbSetOrigin cv (list x y)))

; Create a New Instance in a Cell View:
(defun create-inst (cv inst-name lib cell view x y)
  (dbCreateInst cv inst-name lib cell view (list x y)))

; List All Properties of a Cell View:
(defun list-props (cv)
  (dbGetPropList cv))

; Add a Property to a Cell View:
(defun add-prop (cv prop-name prop-value)
  (dbAddProp cv prop-name prop-value))

; Remove a Property from a Cell View:
(defun remove-prop (cv prop-name)
  (dbDeleteProp cv prop-name))

; Set the View Type of a Cell View:
(defun set-view-type (cv view-type)
  (dbSetViewType cv view-type))

; Connect Two Pins with a Net:
(defun connect-pins (cv pin1 pin2)
  (let ((net (dbCreateNet cv "net")))
    (dbAddNetPin net pin1)
    (dbAddNetPin net pin2)))

; Get the Technology of a Library:
(defun get-tech (lib)
  (dbGetLibTech lib))

; List All Cell Views Using a Specific Layer:
(defun list-cvs-by-layer (layer)
  (dbFindCellViewsByLayer layer))

; List All Nets Connected to a Pin:
(defun list-nets-by-pin (pin)
  (dbGetNetByPin pin))

; Print All Instances and their Bounding Box:
(defun print-insts-bbox (cv)
  (foreach inst (dbGetInsts cv)
    (format t "~A: ~A~%" (dbGetInstName inst) (dbGetBoundBox inst))))

; List All Vias in a Cell View:
(defun list-vias (cv)
  (dbQueryByType cv 'via))

; Create a New Via in a Cell View:
(defun create-via (cv x y via-def)
  (dbCreateVia cv (list x y) via-def))

; Create a New Cell:
(defun create-new-cell (lib cell)
  (dbCreateCellView lib cell "layout" "maskLayout" t))

; Get the Layer of a Shape:
(defun get-shape-layer (shape)
  (dbGetShapeLayer shape))

; Draw a Rectangle in a Layout:
(defun draw-rectangle (lib cell layer x1 y1 x2 y2)
  (let ((theCell (dbOpenCellViewByType lib cell "layout" "maskLayout")))
    (dbCreateRect theCell layer (list x1 y1 x2 y2))))

; Draw a Circle (via Polygon):
(defun draw-circle (lib cell layer x y radius numPoints)
  (let* ((cv (dbOpenCellViewByType lib cell "layout" "maskLayout"))
         (points (loop for i from 0 below numPoints
                       collect (list (+ x (* radius (cos (* 2 pi i numPoints))))
                                     (+ y (* radius (sin (* 2 pi i numPoints))))))))
    (dbCreatePolygon cv layer points)))

; Check if a Cell Exists:
(defun cell-exists? (lib cell)
  (dbOpenCellViewByType lib cell "layout" "maskLayout"))

; Retrieve All Instances in a Cell:
(defun get-all-instances (lib cell)
  (let ((theCell (dbOpenCellViewByType lib cell "layout" "maskLayout")))
    (dbGetInsts theCell)))

; Place an Instance in a Cell:
(defun place-instance (lib cell instName masterLib masterCell x y)
  (let ((theCell (dbOpenCellViewByType lib cell "layout" "maskLayout")))
    (dbCreateInst theCell instName masterLib masterCell nil (list x y) 0)))

