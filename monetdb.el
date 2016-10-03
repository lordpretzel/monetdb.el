(require 'sql)
(require 'sql-indent)

(setq auto-mode-alist
      (cons '("\\.sql$" . sql-mode) auto-mode-alist))

(defvar sql-mode-monetdb-font-lock-keywords
  '(("\\b\\(red\\|orange\\|yellow\\)\\b"
     . font-lock-keyword-face))
  "MonetDB SQL keywords used by font-lock.")

;; (sql-set-product-feature 'monetdb
;; 			 :font-lock
;; 			 'sql-mode-monetdb-font-lock-keywords)

;; ;; (sql-set-product-feature 'monetdb
;; ;; 			 :syntax-alist ((?# . "_")))

(defcustom sql-monetdb-program "mclient"
  "Command to start mclient by MonetDB."
  :type 'file
  :group 'SQL)

;; (defcustom sql-monetdb-login-params '(server
;; 				      user
;; 				      (port :default 54321) database)
;;   "Login parameters to needed to connect to MonetDB."
;;   :type 'sql-login-params
;;   :group 'SQL)



(defcustom sql-monetdb-login-params '(database
				      (port :default 54321))
  "Login parameters to needed to connect to MonetDB."
  :type 'sql-login-params
  :group 'SQL)



(defcustom sql-monetdb-options '()
  "List of additional options for `sql-monetdb-program'."
  :type '(repeat string)
  :group 'SQL)

;; (defun sql-comint-monetdb (product options)
;;   "Create comint buffer and connect to Hive."
;;   (let ((params options))
;;     (sql-comint product params)))



;; (defvar sql-mode-monetdb-font-lock-keywords
;;   '(("\\b\\(red\\|orange\\|yellow\\)\\b"
;;      . font-lock-keyword-face)
;;     ("\\b\\(black\\|green\\|blue\\)\\b"
;;      . font-lock-builtin-face))
;;   "MonetDB SQL keywords used by font-lock.")


(defvar sql-mode-monetdb-font-lock-keywords
  (eval-when-compile
    (list
     ;; MonetDB Functions
     (sql-font-lock-keywords-builder 'font-lock-builtin-face nil
				     "ascii" "avg" "bdmpolyfromtext" "bdmpolyfromwkb" "bdpolyfromtext"
				     "bdpolyfromwkb" "benchmark" "bin" "bit_and" "bit_length" "bit_or"
				     "bit_xor" "both" "cast" "char_length" "character_length" "coalesce"
				     "concat" "concat_ws" "connection_id" "conv" "convert" "count"
				     "curdate" "current_date" "current_time" "current_timestamp" "curtime"
				     "elt" "encrypt" "export_set" "field" "find_in_set" "found_rows" "from"
				     "geomcollfromtext" "geomcollfromwkb" "geometrycollectionfromtext"
				     "geometrycollectionfromwkb" "geometryfromtext" "geometryfromwkb"
				     "geomfromtext" "geomfromwkb" "get_lock" "group_concat" "hex" "ifnull"
				     "instr" "interval" "isnull" "last_insert_id" "lcase" "leading"
				     "length" "linefromtext" "linefromwkb" "linestringfromtext"
				     "linestringfromwkb" "load_file" "locate" "lower" "lpad" "ltrim"
				     "make_set" "master_pos_wait" "max" "mid" "min" "mlinefromtext"
				     "mlinefromwkb" "mpointfromtext" "mpointfromwkb" "mpolyfromtext"
				     "mpolyfromwkb" "multilinestringfromtext" "multilinestringfromwkb"
				     "multipointfromtext" "multipointfromwkb" "multipolygonfromtext"
				     "multipolygonfromwkb" "now" "nullif" "oct" "octet_length" "ord"
				     "pointfromtext" "pointfromwkb" "polyfromtext" "polyfromwkb"
				     "polygonfromtext" "polygonfromwkb" "position" "quote" "rand"
				     "release_lock" "repeat" "replace" "reverse" "rpad" "rtrim" "soundex"
				     "space" "std" "stddev" "substring" "substring_index" "sum" "sysdate"
				     "trailing" "trim" "ucase" "unix_timestamp" "upper" "user" "variance"
				     )

     ;; Monetdb Keywords
     (sql-font-lock-keywords-builder 'font-lock-keyword-face nil
				     "action" "add" "after" "against" "all" "alter" "and" "as" "asc"
				     "auto_increment" "avg_row_length" "bdb" "between" "by" "cascade"
				     "case" "change" "character" "check" "checksum" "close" "collate"
				     "collation" "column" "columns" "comment" "committed" "concurrent"
				     "constraint" "create" "cross" "data" "database" "default"
				     "delay_key_write" "delayed" "delete" "desc" "directory" "disable"
				     "distinct" "distinctrow" "do" "drop" "dumpfile" "duplicate" "else" "elseif"
				     "enable" "enclosed" "end" "escaped" "exists" "fields" "first" "for"
				     "force" "foreign" "from" "full" "fulltext" "global" "group" "handler"
				     "having" "heap" "high_priority" "if" "ignore" "in" "index" "infile"
				     "inner" "insert" "insert_method" "into" "is" "isam" "isolation" "join"
				     "key" "keys" "last" "left" "level" "like" "limit" "lines" "load"
				     "local" "lock" "low_priority" "match" "max_rows" "merge" "min_rows"
				     "mode" "modify" "mrg_myisam" "myisam" "natural" "next" "no" "not"
				     "null" "offset" "oj" "on" "open" "optionally" "or" "order" "outer"
				     "outfile" "pack_keys" "partial" "password" "prev" "primary"
				     "procedure" "quick" "raid0" "raid_type" "read" "references" "rename"
				     "repeatable" "restrict" "right" "rollback" "rollup" "row_format"
				     "savepoint" "select" "separator" "serializable" "session" "set"
				     "share" "show" "sql_big_result" "sql_buffer_result" "sql_cache"
				     "sql_calc_found_rows" "sql_no_cache" "sql_small_result" "starting"
				     "straight_join" "striped" "table" "tables" "temporary" "terminated"
				     "then" "to" "transaction" "truncate" "type" "uncommitted" "union"
				     "unique" "unlock" "update" "use" "using" "values" "when" "where"
				     "with" "write" "xor"
				     )

     ;; MonetDB Data Types
     (sql-font-lock-keywords-builder 'font-lock-type-face nil
				     "bigint" "binary" "bit" "blob" "bool" "boolean" "char" "clob" "curve" "date"
				     "datetime" "dec" "decimal" "double" "enum" "fixed" "float" "geometry"
				     "geometrycollection" "int" "integer" "interval" "line" "linearring" "linestring"
				     "longblob" "longtext" "mediumblob" "mediumint" "mediumtext"
				     "multicurve" "multilinestring" "multipoint" "multipolygon"
				     "multisurface" "national" "numeric" "point" "polygon" "precision"
				     "real" "smallint" "surface" "text" "time" "timestamp" "tinyblob"
				     "tinyint" "tinytext" "unsigned" "varchar" "year" "year2" "year4"
				     "zerofill"
				     )))

  "MonetDB SQL keywords used by font-lock.

This variable is used by `sql-mode' and `sql-interactive-mode'.  The
regular expressions are created during compilation by calling the
function `regexp-opt'.  Therefore, take a look at the source before
you define your own `sql-mode-monetdb-font-lock-keywords'.")



(defun sql-highlight-monetdb-keywords ()
  "Highlight MonetDB keywords."
  (interactive)
  (sql-set-product 'monetdb))

(defun sql-comint-monetdb (product options)
  "Create comint buffer and connect to MonetDB."
  ;; Put all parameters to the program (if defined) in a list and call
  ;; make-comint.
  (let ((params
	 (append
	  options
	  (if (not (= 0 sql-port))
              (list (concat "-p" (number-to-string sql-port))))
          ;; (if (not (string= "" sql-server))
          ;;     (list (concat "-h " sql-server)))
          (if (not (string= "" sql-user))
              (list (concat "-u" sql-user)))
          (if (not (string= "" sql-database))
              (list (concat "-d" sql-database))))))
    (sql-comint product params)))

(defun sql-monetdb (&optional buffer)
  "Run mclient by MonetDB as an inferior process."
  (interactive "P")
  (sql-product-interactive 'monetdb buffer))


(eval-after-load "sql"
  '(sql-add-product
    'monetdb "MonetDB"
    :free-software t
    :font-lock sql-mode-monetdb-font-lock-keywords
    :sqli-program 'sql-monetdb-program
    :sqli-options 'sql-monetdb-options
    :sqli-login 'sql-monetdb-login-params
    :sqli-comint-func 'sql-comint-monetdb
    :list-all "\\d"
    :list-table "\\d %s"
    :prompt-regexp "^sql>"
    :prompt-length 5
    :prompt-cont-regexp "more>"
    :terminator ";"))

(provide 'monetdb)
;;; End of monetdb.el

