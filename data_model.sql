
SET client_encoding = 'UTF8';

CREATE DATABASE "demo_db" WITH     OWNER = distr_user  TEMPLATE template0    ENCODING = 'UTF8'     LC_COLLATE = 'ru_RU.UTF-8'     LC_CTYPE = 'ru_RU.UTF-8'     TABLESPACE = pg_default     CONNECTION LIMIT = -1;

\connect "demo_db"

CREATE TABLE public.acc_number (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    ord bigint,
    parent_acc bigint,
    account_name character varying(2000),
    name__en character varying(2000)
);



--
-- Name: TABLE acc_number; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.acc_number IS 'ОСВ: Номер счета, SysObjTypeEffective{id=2471461, ident=''ACC_NUMBER'', name=''ОСВ: Номер счета'', 13 attributes (13 actualizing)}';


--
-- Name: COLUMN acc_number.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.acc_number.id IS 'ID';


--
-- Name: COLUMN acc_number.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.acc_number.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN acc_number.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.acc_number.name IS 'Name';


--
-- Name: COLUMN acc_number.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.acc_number.create_date IS 'Create date';


--
-- Name: COLUMN acc_number.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.acc_number.type_id IS 'Тип объекта';


--
-- Name: COLUMN acc_number.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.acc_number.status IS 'Status';


--
-- Name: COLUMN acc_number.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.acc_number.org_id IS 'Подразделение';


--
-- Name: COLUMN acc_number.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.acc_number.user_id IS 'Пользователь';


--
-- Name: COLUMN acc_number.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.acc_number.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN acc_number.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.acc_number.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN acc_number.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.acc_number.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN acc_number.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.acc_number.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN acc_number.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.acc_number.is_system IS 'System object';


--
-- Name: COLUMN acc_number.ord; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.acc_number.ord IS 'Порядок';


--
-- Name: COLUMN acc_number.parent_acc; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.acc_number.parent_acc IS 'Родительский счет';


--
-- Name: COLUMN acc_number.account_name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.acc_number.account_name IS 'Наименование счета/субсчета';


--
-- Name: COLUMN acc_number.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.acc_number.name__en IS 'Name, languageSchema=en';


--
-- Name: afhd_ac_trans_link; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.afhd_ac_trans_link (
    id bigint NOT NULL,
    obj_owner_id bigint,
    transaction_id bigint,
    source_row_id bigint,
    reclass_row_id bigint,
    dummy_row_id bigint,
    debit_credit_id bigint,
    comp_sign_id bigint,
    form_inst_id bigint,
    form_section_id bigint,
    consolidation_obj_id bigint,
    statem_trans_id bigint,
    multiply_val numeric,
    account_date timestamp(6) without time zone,
    after_amount numeric,
    before_amount numeric,
    is_excepted smallint,
    is_intragroup smallint,
    is_psb_trans smallint,
    copy_source_ac_tr_l_id bigint,
    link_turnover bigint,
    tbs_item_id bigint,
    multiplicator_sign_id bigint,
    link_calc_turn_log_id bigint,
    okved_activity_id bigint,
    vat numeric,
    balance_type_id bigint,
    account_num_id bigint,
    link_cnt bigint,
    cnt_count character varying(2000),
    contragent_name character varying(2000),
    is_clean_apply smallint,
    cnt_turnover_id bigint,
    vat_calc numeric,
    link_turnover_reserv bigint,
    report_date timestamp(6) without time zone,
    discount numeric,
    cr_id bigint
);



--
-- Name: TABLE afhd_ac_trans_link; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.afhd_ac_trans_link IS 'АФХД. Промежуточный тип операции карточки счета  (декомпозиция), SysObjTypeEffective{id=8883151, ident=''AFHD_AC_TRANS_LINK'', name=''АФХД. Промежуточный тип операции карточки счета  (декомпозиция)'', 9 attributes (0 actualizing)}';


--
-- Name: COLUMN afhd_ac_trans_link.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.id IS 'Код';


--
-- Name: COLUMN afhd_ac_trans_link.obj_owner_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.obj_owner_id IS 'Ссылка на объект владелец';


--
-- Name: COLUMN afhd_ac_trans_link.transaction_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.transaction_id IS 'Ссылка на операцию';


--
-- Name: COLUMN afhd_ac_trans_link.source_row_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.source_row_id IS 'Статья (базовая)';


--
-- Name: COLUMN afhd_ac_trans_link.reclass_row_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.reclass_row_id IS 'Статья (реклассификация)';


--
-- Name: COLUMN afhd_ac_trans_link.dummy_row_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.dummy_row_id IS 'Статья (фиктивная)';


--
-- Name: COLUMN afhd_ac_trans_link.debit_credit_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.debit_credit_id IS 'Дебет/Кредит';


--
-- Name: COLUMN afhd_ac_trans_link.comp_sign_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.comp_sign_id IS 'Арифметический знак';


--
-- Name: COLUMN afhd_ac_trans_link.form_inst_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.form_inst_id IS 'Экземпляр формы отчетности';


--
-- Name: COLUMN afhd_ac_trans_link.form_section_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.form_section_id IS 'Раздел формы отчетности';


--
-- Name: COLUMN afhd_ac_trans_link.consolidation_obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.consolidation_obj_id IS 'Ссылка на объект консолидации';


--
-- Name: COLUMN afhd_ac_trans_link.statem_trans_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.statem_trans_id IS 'Ссылка на транзакцию';


--
-- Name: COLUMN afhd_ac_trans_link.multiply_val; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.multiply_val IS 'Мультипликатор';


--
-- Name: COLUMN afhd_ac_trans_link.account_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.account_date IS 'Дата для учета';


--
-- Name: COLUMN afhd_ac_trans_link.after_amount; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.after_amount IS 'Сумма для учета (консолидация)';


--
-- Name: COLUMN afhd_ac_trans_link.before_amount; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.before_amount IS 'Сумма для учета (декомпозиция)';


--
-- Name: COLUMN afhd_ac_trans_link.is_excepted; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.is_excepted IS 'Исключен';


--
-- Name: COLUMN afhd_ac_trans_link.is_intragroup; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.is_intragroup IS 'ВГО';


--
-- Name: COLUMN afhd_ac_trans_link.is_psb_trans; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.is_psb_trans IS 'Операция проведена в ПСБ?';


--
-- Name: COLUMN afhd_ac_trans_link.copy_source_ac_tr_l_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.copy_source_ac_tr_l_id IS 'Ссылка на источник копирования';


--
-- Name: COLUMN afhd_ac_trans_link.link_turnover; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.link_turnover IS 'Ссылка на проводку по контрагенту';


--
-- Name: COLUMN afhd_ac_trans_link.tbs_item_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.tbs_item_id IS 'Ссылка на проводку "Прочие субконто"';


--
-- Name: COLUMN afhd_ac_trans_link.multiplicator_sign_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.multiplicator_sign_id IS 'Арифметический знак мультипликатора';


--
-- Name: COLUMN afhd_ac_trans_link.link_calc_turn_log_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.link_calc_turn_log_id IS 'Ссылка на связь расчета и ОСВ';


--
-- Name: COLUMN afhd_ac_trans_link.okved_activity_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.okved_activity_id IS 'Вид деятельности (по ОКВЭД)';


--
-- Name: COLUMN afhd_ac_trans_link.vat; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.vat IS 'НДС';


--
-- Name: COLUMN afhd_ac_trans_link.balance_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.balance_type_id IS 'Тип сальдо';


--
-- Name: COLUMN afhd_ac_trans_link.account_num_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.account_num_id IS 'Номер счета';


--
-- Name: COLUMN afhd_ac_trans_link.link_cnt; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.link_cnt IS 'Контрагент из проводки';


--
-- Name: COLUMN afhd_ac_trans_link.cnt_count; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.cnt_count IS 'Контрагент';


--
-- Name: COLUMN afhd_ac_trans_link.contragent_name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.contragent_name IS 'Контрагент унифицированное название';


--
-- Name: COLUMN afhd_ac_trans_link.is_clean_apply; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.is_clean_apply IS 'Применяется очистка внутригрупповых операций';


--
-- Name: COLUMN afhd_ac_trans_link.cnt_turnover_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.cnt_turnover_id IS 'Ссылка на проводку "Субконто счет"';


--
-- Name: COLUMN afhd_ac_trans_link.vat_calc; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.vat_calc IS 'Ставка НДС (для Выручки, расчетная)';


--
-- Name: COLUMN afhd_ac_trans_link.link_turnover_reserv; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.link_turnover_reserv IS 'Ссылка на проводку "Субконто контрагенты" (для логики резервов)';


--
-- Name: COLUMN afhd_ac_trans_link.report_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.report_date IS 'Дата отчетности';


--
-- Name: COLUMN afhd_ac_trans_link.discount; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.discount IS 'Дисконт';


--
-- Name: COLUMN afhd_ac_trans_link.cr_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.afhd_ac_trans_link.cr_id IS 'Ссылка на КЗ (полный анализ)';


--
-- Name: sys_obj_type; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.sys_obj_type (
    id bigint NOT NULL,
    name character varying(2000) NOT NULL,
    ident character varying(2000) NOT NULL,
    table_name character varying(2000) NOT NULL,
    parent_id bigint,
    field_name_prefix character varying(2000),
    is_hierarchy smallint,
    is_system smallint,
    type_id bigint NOT NULL,
    org_id bigint NOT NULL,
    status smallint NOT NULL,
    create_date timestamp without time zone NOT NULL,
    user_id bigint NOT NULL,
    name__en character varying(2000),
    name__ru character varying(2000),
    full_access_mask bigint NOT NULL,
    use_curmtx_rights smallint,
    java_handler character varying(2000),
    not_copy smallint,
    created_emp_id bigint NOT NULL,
    last_modified_user_id bigint NOT NULL,
    last_modified_emp_id bigint NOT NULL,
    last_modified_date timestamp without time zone NOT NULL,
    obj_type_attr_id bigint,
    is_time_depended smallint,
    js_handler character varying(2000),
    is_readonly_by_default smallint,
    alg_saving_id bigint,
    alg_saved_id bigint,
    id_seq_name character varying(2000),
    ext_types_multiselect smallint,
    use_cache smallint,
    hist_attr_force_create smallint,
    link_access_attr_id bigint,
    access_type_id bigint,
    ext_types_widget_name character varying(2000),
    ext_types_hide_btn smallint,
    rf_connection bigint,
    attr_with_name bigint,
    alg_deleting_id bigint,
    display_obj_inst bigint,
    is_enabled_change_audit smallint,
    allow_ignore_lifecycle smallint,
    sys_content_type_id bigint,
    init_cache smallint,
    sys_obj_type_is_mdata smallint,
    note character varying(2000),
    note__ru character varying(2000),
    note__en character varying(2000)
);



--
-- Name: TABLE sys_obj_type; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.sys_obj_type IS 'Тип объекта в Системе';


--
-- Name: COLUMN sys_obj_type.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.id IS 'Код, SysTypeAttrEffective{} AbstractAttrEffective{id=101002, ident=''ID''}';


--
-- Name: COLUMN sys_obj_type.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.name IS 'Наименование, SysTypeAttrEffective{} AbstractAttrEffective{id=101003, ident=''NAME''}';


--
-- Name: COLUMN sys_obj_type.ident; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.ident IS 'Идентификатор, SysTypeAttrEffective{} AbstractAttrEffective{id=105050, ident=''IDENT''}';


--
-- Name: COLUMN sys_obj_type.table_name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.table_name IS 'Наименование таблицы, SysTypeAttrEffective{} AbstractAttrEffective{id=105051, ident=''TABLE_NAME''}';


--
-- Name: COLUMN sys_obj_type.parent_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.parent_id IS 'Родитель, SysTypeAttrEffective{} AbstractAttrEffective{id=105052, ident=''SYS_OBJ_TYPE_PARENT_ID''}';


--
-- Name: COLUMN sys_obj_type.field_name_prefix; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.field_name_prefix IS 'Префикс наименования поля, SysTypeAttrEffective{} AbstractAttrEffective{id=105056, ident=''SYS_OBJ_TYPE_FIELD_NAME_PREFIX''}';


--
-- Name: COLUMN sys_obj_type.is_hierarchy; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.is_hierarchy IS 'Иерархический тип, SysTypeAttrEffective{} AbstractAttrEffective{id=105076, ident=''SYS_OBJ_TYPE_IS_HIERARCHY''}';


--
-- Name: COLUMN sys_obj_type.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.is_system IS 'Системный объект, SysTypeAttrEffective{} AbstractAttrEffective{id=105077, ident=''SYS_OBJ_TYPE_IS_SYSTEM''}';


--
-- Name: COLUMN sys_obj_type.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.type_id IS 'Тип объекта, SysTypeAttrEffective{} AbstractAttrEffective{id=101005, ident=''TYPE_ID''}';


--
-- Name: COLUMN sys_obj_type.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.org_id IS 'Подразделение, SysTypeAttrEffective{} AbstractAttrEffective{id=101007, ident=''ORG_ID''}';


--
-- Name: COLUMN sys_obj_type.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.status IS 'Статус, SysTypeAttrEffective{} AbstractAttrEffective{id=101006, ident=''STATUS''}';


--
-- Name: COLUMN sys_obj_type.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.create_date IS 'Дата создания, SysTypeAttrEffective{} AbstractAttrEffective{id=101004, ident=''CREATE_DATE''}';


--
-- Name: COLUMN sys_obj_type.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.user_id IS 'Пользователь, SysTypeAttrEffective{} AbstractAttrEffective{id=101008, ident=''USER_ID''}';


--
-- Name: COLUMN sys_obj_type.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.name__en IS 'Наименование, SysTypeAttrEffective{} AbstractAttrEffective{id=101003, ident=''NAME''}, languageSchema=en';


--
-- Name: COLUMN sys_obj_type.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.name__ru IS 'Наименование, SysTypeAttrEffective{} AbstractAttrEffective{id=101003, ident=''NAME''}, languageSchema=ru';


--
-- Name: COLUMN sys_obj_type.full_access_mask; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.full_access_mask IS 'Маска полных прав доступа, SysTypeAttrEffective{} AbstractAttrEffective{id=108029, ident=''SYS_OBJ_TYPE_FULL_ACCESS_MASK''}';


--
-- Name: COLUMN sys_obj_type.use_curmtx_rights; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.use_curmtx_rights IS 'Права по матрице курируемости, вместо системных, SysTypeAttrEffective{} AbstractAttrEffective{id=112075, ident=''USE_CURMTX_RIGHTS''}';


--
-- Name: COLUMN sys_obj_type.java_handler; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.java_handler IS 'Сист. обработчик, SysTypeAttrEffective{} AbstractAttrEffective{id=119605, ident=''SYS_OBJ_TYPE_JAVA_HANDLER''}';


--
-- Name: COLUMN sys_obj_type.not_copy; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.not_copy IS 'Не копировать, SysTypeAttrEffective{} AbstractAttrEffective{id=160716, ident=''SYS_OBJECT_DO_NOT_COPY''}';


--
-- Name: COLUMN sys_obj_type.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.created_emp_id IS 'Сотрудник, создавший объект, SysTypeAttrEffective{} AbstractAttrEffective{id=101011, ident=''CREATED_EMP_ID''}';


--
-- Name: COLUMN sys_obj_type.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.last_modified_user_id IS 'Пользователь, кто последним изменил, SysTypeAttrEffective{} AbstractAttrEffective{id=101010, ident=''LAST_MODIFIED_USER_ID''}';


--
-- Name: COLUMN sys_obj_type.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.last_modified_emp_id IS 'Сотрудник, кто последним изменил, SysTypeAttrEffective{} AbstractAttrEffective{id=101012, ident=''LAST_MODIFIED_EMP_ID''}';


--
-- Name: COLUMN sys_obj_type.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.last_modified_date IS 'Дата последнего изменения, SysTypeAttrEffective{} AbstractAttrEffective{id=101009, ident=''LAST_MODIFIED_DATE''}';


--
-- Name: COLUMN sys_obj_type.obj_type_attr_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.obj_type_attr_id IS 'Атрибут иерархии, SysTypeAttrEffective{} AbstractAttrEffective{id=129163, ident=''SYS_OBJ_TYPE_HIER_ATTR_ID''}';


--
-- Name: COLUMN sys_obj_type.is_time_depended; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.is_time_depended IS 'Атрибуты могут зависеть от времени, SysTypeAttrEffective{} AbstractAttrEffective{id=124834, ident=''IS_TIME_DEPENDED''}';


--
-- Name: COLUMN sys_obj_type.js_handler; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.js_handler IS 'JS обработчик, SysTypeAttrEffective{} AbstractAttrEffective{id=10054, ident=''SYS_OBJ_TYPE_JS_HANDLER''}';


--
-- Name: COLUMN sys_obj_type.is_readonly_by_default; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.is_readonly_by_default IS 'Открывать объекты в режиме только чтение, SysTypeAttrEffective{} AbstractAttrEffective{id=11270, ident=''IS_READONLY_BY_DEFAULT''}';


--
-- Name: COLUMN sys_obj_type.alg_saving_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.alg_saving_id IS 'Жизненный цикл: перед сохранением, SysTypeAttrEffective{} AbstractAttrEffective{id=11651, ident=''ALG_SAVING''}';


--
-- Name: COLUMN sys_obj_type.alg_saved_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.alg_saved_id IS 'Жизненный цикл: после сохранения, SysTypeAttrEffective{} AbstractAttrEffective{id=11666, ident=''ALG_SAVED''}';


--
-- Name: COLUMN sys_obj_type.ext_types_multiselect; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.ext_types_multiselect IS 'Выбор нескольких расширений в рамках одного экземпляра, SysTypeAttrEffective{id=756321, ident=''EXT_TYPES_MULTISELECT''}';


--
-- Name: COLUMN sys_obj_type.use_cache; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.use_cache IS 'Использовать кэш, SysTypeAttrEffective{id=758811, ident=''USE_CACHE''}';


--
-- Name: COLUMN sys_obj_type.hist_attr_force_create; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.hist_attr_force_create IS 'Принудительное создание версий исторических атрибутов, SysTypeAttrEffective{id=822891, ident=''HIST_ATTR_FORCE_CREATE''}';


--
-- Name: COLUMN sys_obj_type.link_access_attr_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.link_access_attr_id IS 'Атрибут для наследования прав, SysTypeAttrEffective{id=825793, ident=''LINK_ACCESS_ATTR''}';


--
-- Name: COLUMN sys_obj_type.access_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.access_type_id IS 'Вид контроля прав, SysTypeAttrEffective{id=825791, ident=''ACCESS_TYPE''}';


--
-- Name: COLUMN sys_obj_type.ext_types_widget_name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.ext_types_widget_name IS 'Заголовок потенциального типа в карточке, SysTypeAttrEffective{id=835476, ident=''EXT_TYPES_WIDGET_NAME''}';


--
-- Name: COLUMN sys_obj_type.ext_types_hide_btn; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.ext_types_hide_btn IS 'Скрывать кнопку Расширения в карточке объекта, SysTypeAttrEffective{id=835474, ident=''EXT_TYPES_HIDE_BTN''}';


--
-- Name: COLUMN sys_obj_type.rf_connection; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.rf_connection IS 'Соединение с внешней БД';


--
-- Name: COLUMN sys_obj_type.attr_with_name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.attr_with_name IS 'Атрибут для наименования';


--
-- Name: COLUMN sys_obj_type.alg_deleting_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.alg_deleting_id IS 'Событие перед удалением';


--
-- Name: COLUMN sys_obj_type.display_obj_inst; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.display_obj_inst IS 'Отображение экземпляра объекта';


--
-- Name: COLUMN sys_obj_type.is_enabled_change_audit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.is_enabled_change_audit IS 'Записывать изменения в аудит';


--
-- Name: COLUMN sys_obj_type.allow_ignore_lifecycle; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.allow_ignore_lifecycle IS 'Возможно сохранение объекта без выполнения выражений/ЖЦ';


--
-- Name: COLUMN sys_obj_type.sys_content_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.sys_content_type_id IS 'Тип содержимого';


--
-- Name: COLUMN sys_obj_type.init_cache; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.init_cache IS 'Добавлять в кэш при инициализации';


--
-- Name: COLUMN sys_obj_type.sys_obj_type_is_mdata; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.sys_obj_type_is_mdata IS 'Метадата';


--
-- Name: COLUMN sys_obj_type.note; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.note IS 'Описание';


--
-- Name: COLUMN sys_obj_type.note__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.note__ru IS 'Описание, languageSchema=ru';


--
-- Name: COLUMN sys_obj_type.note__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_type.note__en IS 'Описание, languageSchema=en';


--
-- Name: sys_object; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.sys_object (
    id bigint NOT NULL,
    name character varying(2000) NOT NULL,
    type_id bigint NOT NULL,
    org_id bigint NOT NULL,
    status smallint NOT NULL,
    create_date timestamp without time zone NOT NULL,
    user_id bigint NOT NULL,
    name__en character varying(2000),
    name__ru character varying(2000),
    created_emp_id bigint NOT NULL,
    last_modified_user_id bigint NOT NULL,
    last_modified_emp_id bigint NOT NULL,
    last_modified_date timestamp without time zone NOT NULL,
    is_system smallint
);



--
-- Name: TABLE sys_object; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.sys_object IS 'Объект, SysObjectType{id=2, name=''Объект'', ident=''SYS_OBJECT''}';


--
-- Name: COLUMN sys_object.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_object.id IS 'Сист. Код, SysAttribute{id=''10000'', name=''Сист. Код'', ident=''ID'', isTimeDepended=''false''}';


--
-- Name: COLUMN sys_object.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_object.name IS 'Наименование, SysTypeAttrEffective{} AbstractAttrEffective{id=101003, ident=''NAME''}';


--
-- Name: COLUMN sys_object.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_object.type_id IS 'Тип объекта, SysTypeAttrEffective{} AbstractAttrEffective{id=101005, ident=''TYPE_ID''}';


--
-- Name: COLUMN sys_object.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_object.org_id IS 'Подразделение, SysTypeAttrEffective{} AbstractAttrEffective{id=101007, ident=''ORG_ID''}';


--
-- Name: COLUMN sys_object.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_object.status IS 'Сист. Статус, SysAttribute{id=''10004'', name=''Сист. Статус'', ident=''STATUS'', isTimeDepended=''false''}';


--
-- Name: COLUMN sys_object.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_object.create_date IS 'Дата создания, SysTypeAttrEffective{} AbstractAttrEffective{id=101004, ident=''CREATE_DATE''}';


--
-- Name: COLUMN sys_object.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_object.user_id IS 'Сист. Пользователь, SysAttribute{id=''10006'', name=''Сист. Пользователь'', ident=''USER_ID'', isTimeDepended=''false''}';


--
-- Name: COLUMN sys_object.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_object.name__en IS 'Сист. Наименование, SysAttribute{id=''10001'', name=''Сист. Наименование'', ident=''NAME'', isTimeDepended=''false''}, languageSchema=en';


--
-- Name: COLUMN sys_object.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_object.name__ru IS 'Сист. Наименование, SysAttribute{id=''10001'', name=''Сист. Наименование'', ident=''NAME'', isTimeDepended=''false''}, languageSchema=ru';


--
-- Name: COLUMN sys_object.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_object.created_emp_id IS 'Сотрудник, создавший объект, SysTypeAttrEffective{} AbstractAttrEffective{id=101011, ident=''CREATED_EMP_ID''}';


--
-- Name: COLUMN sys_object.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_object.last_modified_user_id IS 'Пользователь, кто последним изменил, SysTypeAttrEffective{} AbstractAttrEffective{id=101010, ident=''LAST_MODIFIED_USER_ID''}';


--
-- Name: COLUMN sys_object.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_object.last_modified_emp_id IS 'Сист. Сотрудник, кто последним изменил, SysAttribute{id=''10040'', name=''Сист. Сотрудник, кто последним изменил'', ident=''LAST_MODIFIED_EMP_ID'', isTimeDepended=''false''}';


--
-- Name: COLUMN sys_object.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_object.last_modified_date IS 'Сист. Дата последнего изменения, SysAttribute{id=''10037'', name=''Сист. Дата последнего изменения'', ident=''LAST_MODIFIED_DATE'', isTimeDepended=''false''}';


--
-- Name: COLUMN sys_object.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_object.is_system IS 'Сист. Системный объект, SysAttribute{id=''10016'', name=''Сист. Системный объект'', ident=''SYS_OBJ_TYPE_IS_SYSTEM'', isTimeDepended=''false''}';


--
-- Name: application_obj; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.application_obj (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    afl_doc_num character varying(2000),
    afl_doc_data timestamp without time zone,
    afp_state_id bigint,
    initiator_id bigint,
    emp_id bigint,
    processing_steps_id bigint,
    temp_cont_turn bigint,
    cr_id bigint,
    scp_tech_ctredit bigint,
    scp_business_segment bigint,
    client_type_id bigint,
    gsl_data_cont_id bigint,
    industry_code_id bigint,
    scp_product_str character varying(2000),
    is_state_program smallint,
    cred_technology_str character varying(2000),
    is_fin_activ_newsub smallint,
    prelim_gsl_calc_id bigint
);



--
-- Name: TABLE application_obj; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.application_obj IS 'Заявка, SysObjTypeEffective{id=2500922, ident=''APPLICATION_OBJ'', name=''Заявка'', 18 attributes (18 actualizing)}';


--
-- Name: COLUMN application_obj.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.id IS 'ID';


--
-- Name: COLUMN application_obj.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN application_obj.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN application_obj.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.name IS 'Name';


--
-- Name: COLUMN application_obj.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.create_date IS 'Create date';


--
-- Name: COLUMN application_obj.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.type_id IS 'Тип объекта';


--
-- Name: COLUMN application_obj.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.status IS 'Status';


--
-- Name: COLUMN application_obj.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.org_id IS 'Подразделение';


--
-- Name: COLUMN application_obj.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.user_id IS 'Пользователь';


--
-- Name: COLUMN application_obj.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN application_obj.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN application_obj.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN application_obj.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN application_obj.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.is_system IS 'System object';


--
-- Name: COLUMN application_obj.afl_doc_num; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.afl_doc_num IS 'Номер документа';


--
-- Name: COLUMN application_obj.afl_doc_data; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.afl_doc_data IS 'Дата документа';


--
-- Name: COLUMN application_obj.afp_state_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.afp_state_id IS 'Состояние';


--
-- Name: COLUMN application_obj.initiator_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.initiator_id IS 'Клиент';


--
-- Name: COLUMN application_obj.emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.emp_id IS 'Ответственный менеджер';


--
-- Name: COLUMN application_obj.processing_steps_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.processing_steps_id IS 'Текущий этап обработки';


--
-- Name: COLUMN application_obj.temp_cont_turn; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.temp_cont_turn IS 'Промежуточный контейнер загрузки ОСВ';


--
-- Name: COLUMN application_obj.cr_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.cr_id IS 'Ссылка на КЗ';


--
-- Name: COLUMN application_obj.scp_tech_ctredit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.scp_tech_ctredit IS 'Технология кредитования';


--
-- Name: COLUMN application_obj.scp_business_segment; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.scp_business_segment IS 'Клиентский сегмент';


--
-- Name: COLUMN application_obj.client_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.client_type_id IS 'Тип клиента';


--
-- Name: COLUMN application_obj.gsl_data_cont_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.gsl_data_cont_id IS 'Ссылка на контейнер данных ГСЛ';


--
-- Name: COLUMN application_obj.industry_code_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.industry_code_id IS 'Отрасль клиента';


--
-- Name: COLUMN application_obj.scp_product_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.scp_product_str IS 'Продукт (строка)';


--
-- Name: COLUMN application_obj.is_state_program; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.is_state_program IS 'Применение госпрограммы';


--
-- Name: COLUMN application_obj.cred_technology_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.cred_technology_str IS 'Технология кредитования (строка)';


--
-- Name: COLUMN application_obj.is_fin_activ_newsub; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.is_fin_activ_newsub IS 'Финансирование деятельности в НС';


--
-- Name: COLUMN application_obj.prelim_gsl_calc_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.application_obj.prelim_gsl_calc_id IS 'Ссылка на предварительный расчет';


--
-- Name: business_segment; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.business_segment (
    id bigint NOT NULL,
    name__en character varying(2000),
    name__ru character varying(2000),
    name character varying(2000) NOT NULL,
    create_date timestamp without time zone NOT NULL,
    type_id bigint NOT NULL,
    status smallint NOT NULL,
    org_id bigint NOT NULL,
    user_id bigint NOT NULL,
    last_modified_date timestamp without time zone NOT NULL,
    last_modified_user_id bigint NOT NULL,
    created_emp_id bigint NOT NULL,
    last_modified_emp_id bigint NOT NULL,
    is_system smallint,
    ident character varying(2000),
    type_int_code bigint
);



--
-- Name: TABLE business_segment; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.business_segment IS 'Сегмент бизнеса клиента, SysObjTypeEffective{id=827363, ident=''BUSINESS_SEGMENT'', name=''Сегмент бизнеса клиента''}';


--
-- Name: COLUMN business_segment.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.business_segment.id IS 'Код, SysTypeAttrEffective{id=101002, ident=''ID''}';


--
-- Name: COLUMN business_segment.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.business_segment.name__en IS 'Наименование, SysTypeAttrEffective{id=101003, ident=''NAME''}, languageSchema=en';


--
-- Name: COLUMN business_segment.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.business_segment.name__ru IS 'Наименование, SysTypeAttrEffective{id=101003, ident=''NAME''}, languageSchema=ru';


--
-- Name: COLUMN business_segment.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.business_segment.name IS 'Наименование, SysTypeAttrEffective{id=101003, ident=''NAME''}';


--
-- Name: COLUMN business_segment.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.business_segment.create_date IS 'Дата создания, SysTypeAttrEffective{id=101004, ident=''CREATE_DATE''}';


--
-- Name: COLUMN business_segment.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.business_segment.type_id IS 'Тип объекта, SysTypeAttrEffective{id=101005, ident=''TYPE_ID''}';


--
-- Name: COLUMN business_segment.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.business_segment.status IS 'Статус, SysTypeAttrEffective{id=101006, ident=''STATUS''}';


--
-- Name: COLUMN business_segment.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.business_segment.org_id IS 'Подразделение, SysTypeAttrEffective{id=101007, ident=''ORG_ID''}';


--
-- Name: COLUMN business_segment.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.business_segment.user_id IS 'Пользователь, SysTypeAttrEffective{id=101008, ident=''USER_ID''}';


--
-- Name: COLUMN business_segment.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.business_segment.last_modified_date IS 'Дата последнего изменения, SysTypeAttrEffective{id=101009, ident=''LAST_MODIFIED_DATE''}';


--
-- Name: COLUMN business_segment.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.business_segment.last_modified_user_id IS 'Пользователь, кто последним изменил, SysTypeAttrEffective{id=101010, ident=''LAST_MODIFIED_USER_ID''}';


--
-- Name: COLUMN business_segment.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.business_segment.created_emp_id IS 'Сотрудник, создавший объект, SysTypeAttrEffective{id=101011, ident=''CREATED_EMP_ID''}';


--
-- Name: COLUMN business_segment.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.business_segment.last_modified_emp_id IS 'Сотрудник, кто последним изменил, SysTypeAttrEffective{id=101012, ident=''LAST_MODIFIED_EMP_ID''}';


--
-- Name: COLUMN business_segment.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.business_segment.is_system IS 'Системный объект, SysTypeAttrEffective{id=105077, ident=''SYS_OBJ_TYPE_IS_SYSTEM''}';


--
-- Name: COLUMN business_segment.ident; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.business_segment.ident IS 'Идентификатор';


--
-- Name: COLUMN business_segment.type_int_code; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.business_segment.type_int_code IS 'Код типа технологии';


--
-- Name: cb_interest_rate; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.cb_interest_rate (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    date_start_cb timestamp(6) without time zone,
    date_end_cb timestamp(6) without time zone,
    grade_number_cb numeric
);



--
-- Name: TABLE cb_interest_rate; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.cb_interest_rate IS 'Процентная ставка ЦБ, SysObjTypeEffective{id=2139072, ident=''CB_INTEREST_RATE'', name=''Процентная ставка ЦБ'', 12 attributes (12 actualizing)}';


--
-- Name: COLUMN cb_interest_rate.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.cb_interest_rate.id IS 'ID';


--
-- Name: COLUMN cb_interest_rate.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.cb_interest_rate.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN cb_interest_rate.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.cb_interest_rate.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN cb_interest_rate.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.cb_interest_rate.name IS 'Name';


--
-- Name: COLUMN cb_interest_rate.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.cb_interest_rate.create_date IS 'Create date';


--
-- Name: COLUMN cb_interest_rate.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.cb_interest_rate.type_id IS 'Тип объекта';


--
-- Name: COLUMN cb_interest_rate.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.cb_interest_rate.status IS 'Status';


--
-- Name: COLUMN cb_interest_rate.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.cb_interest_rate.org_id IS 'Подразделение';


--
-- Name: COLUMN cb_interest_rate.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.cb_interest_rate.user_id IS 'Пользователь';


--
-- Name: COLUMN cb_interest_rate.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.cb_interest_rate.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN cb_interest_rate.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.cb_interest_rate.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN cb_interest_rate.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.cb_interest_rate.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN cb_interest_rate.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.cb_interest_rate.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN cb_interest_rate.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.cb_interest_rate.is_system IS 'System object';


--
-- Name: COLUMN cb_interest_rate.date_start_cb; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.cb_interest_rate.date_start_cb IS 'Дата начала действия';


--
-- Name: COLUMN cb_interest_rate.date_end_cb; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.cb_interest_rate.date_end_cb IS 'Дата окончания действия';


--
-- Name: COLUMN cb_interest_rate.grade_number_cb; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.cb_interest_rate.grade_number_cb IS 'Значение';


--
-- Name: corp_tech_application; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.corp_tech_application (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    afl_doc_num character varying(2000),
    afl_doc_data timestamp without time zone,
    afp_state_id bigint,
    initiator_id bigint,
    emp_id bigint,
    processing_steps_id bigint,
    temp_cont_turn bigint,
    cr_id bigint,
    scp_tech_ctredit bigint,
    scp_business_segment bigint,
    client_type_id bigint,
    is_without_pledge smallint,
    lim_currency_id bigint,
    req_type_id bigint,
    credit_logic_id bigint,
    gsl_limit numeric,
    is_main_owner smallint,
    risk_zone_id bigint,
    scp_arm_manager_id bigint,
    loan_terms bigint,
    auto_check_status bigint,
    lim_sum numeric,
    third_parties text,
    scp_proc_steds_id bigint,
    is_active_get_gsl_part smallint,
    is_na_active smallint,
    deleg_region_id bigint,
    client_list_changed smallint,
    gsl_data_cont_id bigint,
    scp_gsl_name_str character varying(2000),
    ca_rout_office_id bigint,
    is_form_bch_active smallint,
    is_active_exp_sec smallint,
    scp_hcm_decision_id bigint,
    scp_appl_type_id bigint,
    comment_txt text,
    sec_conclusion_id bigint,
    is_bch_validator_on smallint,
    industry_code_id bigint,
    scp_product_str character varying(2000),
    is_state_program smallint,
    cred_technology_str character varying(2000),
    is_auto_check_errors smallint,
    scp_type_restruct_id bigint,
    interm_file_storage bigint,
    suz_start_page_str character varying(2000),
    is_legal_exp_launched smallint,
    is_legal_exp_restart smallint,
    scp_cheif_cm_id bigint,
    collat_initiator_id bigint,
    is_return_awp smallint,
    iniciator_emp_id bigint,
    scp_rejection_client_id bigint,
    is_app_to_cred_depart smallint,
    scp_rejection_comment text,
    reason_refusal_id bigint,
    cred_depart_opinion_txt text,
    is_start_bp_fa smallint,
    is_start_bp_request_fa smallint,
    is_simplified_fa smallint,
    is_tech_ham_task_comp smallint,
    is_auto_sec_errors smallint,
    pricing_id bigint,
    calc_risk_date timestamp(6) without time zone,
    collateral_cont_id bigint,
    resp_cond_coord bigint,
    is_fin_activ_newsub smallint,
    prelim_gsl_calc_id bigint,
    exp_fa_office_id bigint,
    scp_conclusion_comment character varying(2000)
);



--
-- Name: TABLE corp_tech_application; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.corp_tech_application IS 'КТ. Заявка , SysObjTypeEffective{id=8751785, ident=''CORP_TECH_APPLICATION'', name=''КТ. Заявка '', 56 attributes (56 actualizing)}';


--
-- Name: COLUMN corp_tech_application.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.id IS 'ID';


--
-- Name: COLUMN corp_tech_application.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN corp_tech_application.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN corp_tech_application.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.name IS 'Name';


--
-- Name: COLUMN corp_tech_application.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.create_date IS 'Create date';


--
-- Name: COLUMN corp_tech_application.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.type_id IS 'Тип объекта';


--
-- Name: COLUMN corp_tech_application.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.status IS 'Status';


--
-- Name: COLUMN corp_tech_application.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.org_id IS 'Подразделение';


--
-- Name: COLUMN corp_tech_application.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.user_id IS 'Пользователь';


--
-- Name: COLUMN corp_tech_application.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN corp_tech_application.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN corp_tech_application.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN corp_tech_application.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN corp_tech_application.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.is_system IS 'System object';


--
-- Name: COLUMN corp_tech_application.afl_doc_num; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.afl_doc_num IS 'Номер документа';


--
-- Name: COLUMN corp_tech_application.afl_doc_data; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.afl_doc_data IS 'Дата документа';


--
-- Name: COLUMN corp_tech_application.afp_state_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.afp_state_id IS 'Состояние';


--
-- Name: COLUMN corp_tech_application.initiator_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.initiator_id IS 'Клиент';


--
-- Name: COLUMN corp_tech_application.emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.emp_id IS 'Ответственный менеджер';


--
-- Name: COLUMN corp_tech_application.processing_steps_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.processing_steps_id IS 'Текущий этап обработки';


--
-- Name: COLUMN corp_tech_application.temp_cont_turn; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.temp_cont_turn IS 'Промежуточный контейнер загрузки ОСВ';


--
-- Name: COLUMN corp_tech_application.cr_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.cr_id IS 'Ссылка на КЗ';


--
-- Name: COLUMN corp_tech_application.scp_tech_ctredit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.scp_tech_ctredit IS 'Технология кредитования';


--
-- Name: COLUMN corp_tech_application.scp_business_segment; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.scp_business_segment IS 'Клиентский сегмент';


--
-- Name: COLUMN corp_tech_application.client_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.client_type_id IS 'Тип клиента';


--
-- Name: COLUMN corp_tech_application.is_without_pledge; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.is_without_pledge IS 'Без залога';


--
-- Name: COLUMN corp_tech_application.lim_currency_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.lim_currency_id IS 'Валюта';


--
-- Name: COLUMN corp_tech_application.req_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.req_type_id IS 'Класс заявки';


--
-- Name: COLUMN corp_tech_application.credit_logic_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.credit_logic_id IS 'Логика кредитования';


--
-- Name: COLUMN corp_tech_application.gsl_limit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.gsl_limit IS 'Сумма общего лимита';


--
-- Name: COLUMN corp_tech_application.is_main_owner; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.is_main_owner IS 'Основные собственники';


--
-- Name: COLUMN corp_tech_application.risk_zone_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.risk_zone_id IS 'Результат проверки благонадежности и деловой репутации по заявке';


--
-- Name: COLUMN corp_tech_application.scp_arm_manager_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.scp_arm_manager_id IS 'Сотрудник АРМ';


--
-- Name: COLUMN corp_tech_application.loan_terms; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.loan_terms IS 'Срок лимита';


--
-- Name: COLUMN corp_tech_application.auto_check_status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.auto_check_status IS 'Статус автопроверок';


--
-- Name: COLUMN corp_tech_application.lim_sum; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.lim_sum IS 'Сумма заявки';


--
-- Name: COLUMN corp_tech_application.third_parties; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.third_parties IS 'Третьи лица';


--
-- Name: COLUMN corp_tech_application.scp_proc_steds_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.scp_proc_steds_id IS 'Этап обработки';


--
-- Name: COLUMN corp_tech_application.is_active_get_gsl_part; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.is_active_get_gsl_part IS 'Запущена сборка ГСЛ (тех)';


--
-- Name: COLUMN corp_tech_application.is_na_active; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.is_na_active IS 'Интеграция с НА по получению кредитных обязательств активна';


--
-- Name: COLUMN corp_tech_application.deleg_region_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.deleg_region_id IS 'Регион клиента';


--
-- Name: COLUMN corp_tech_application.client_list_changed; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.client_list_changed IS 'Состав клиентов был изменен';


--
-- Name: COLUMN corp_tech_application.gsl_data_cont_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.gsl_data_cont_id IS 'Ссылка на контейнер данных ГСЛ';


--
-- Name: COLUMN corp_tech_application.scp_gsl_name_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.scp_gsl_name_str IS 'Наименование ГСЛ';


--
-- Name: COLUMN corp_tech_application.ca_rout_office_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.ca_rout_office_id IS 'Офис маршрутизации для КА';


--
-- Name: COLUMN corp_tech_application.is_form_bch_active; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.is_form_bch_active IS 'Запущен сбор БКИ (тех.)';


--
-- Name: COLUMN corp_tech_application.is_active_exp_sec; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.is_active_exp_sec IS 'Заблокировано изменение участников (тех.)';


--
-- Name: COLUMN corp_tech_application.scp_hcm_decision_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.scp_hcm_decision_id IS 'Вариант решения на задаче руководителя КМ';


--
-- Name: COLUMN corp_tech_application.scp_appl_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.scp_appl_type_id IS 'Тип заявки';


--
-- Name: COLUMN corp_tech_application.comment_txt; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.comment_txt IS 'Комментарий проверки СЭБ';


--
-- Name: COLUMN corp_tech_application.sec_conclusion_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.sec_conclusion_id IS 'Вывод';


--
-- Name: COLUMN corp_tech_application.is_bch_validator_on; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.is_bch_validator_on IS 'Запущен валидатор БКИ (тех)';


--
-- Name: COLUMN corp_tech_application.industry_code_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.industry_code_id IS 'Отрасль клиента';


--
-- Name: COLUMN corp_tech_application.scp_product_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.scp_product_str IS 'Продукт (строка)';


--
-- Name: COLUMN corp_tech_application.is_state_program; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.is_state_program IS 'Применение госпрограммы';


--
-- Name: COLUMN corp_tech_application.cred_technology_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.cred_technology_str IS 'Технология кредитования (строка)';


--
-- Name: COLUMN corp_tech_application.is_auto_check_errors; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.is_auto_check_errors IS 'Наличие ошибок (предпроверки)';


--
-- Name: COLUMN corp_tech_application.scp_type_restruct_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.scp_type_restruct_id IS 'Тип реструктуризации';


--
-- Name: COLUMN corp_tech_application.interm_file_storage; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.interm_file_storage IS 'Промежуточное хранение файла для загрузки';


--
-- Name: COLUMN corp_tech_application.suz_start_page_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.suz_start_page_str IS 'Ссылка на стартовую страницу СУЗ';


--
-- Name: COLUMN corp_tech_application.is_legal_exp_launched; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.is_legal_exp_launched IS 'Запущена экспертиза правоспособности (тех.)';


--
-- Name: COLUMN corp_tech_application.is_legal_exp_restart; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.is_legal_exp_restart IS 'Перезапуск экспертизы правоспособности (тех.)';


--
-- Name: COLUMN corp_tech_application.scp_cheif_cm_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.scp_cheif_cm_id IS 'Руководитель КМ';


--
-- Name: COLUMN corp_tech_application.collat_initiator_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.collat_initiator_id IS 'Ответственный за проведение экспертизы залогов';


--
-- Name: COLUMN corp_tech_application.is_return_awp; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.is_return_awp IS 'Будет направлено АРМ';


--
-- Name: COLUMN corp_tech_application.iniciator_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.iniciator_emp_id IS 'Ответственный за проведение экспертизы правоспособности';


--
-- Name: COLUMN corp_tech_application.scp_rejection_client_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.scp_rejection_client_id IS 'Причина отказа Клиента';


--
-- Name: COLUMN corp_tech_application.is_app_to_cred_depart; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.is_app_to_cred_depart IS 'Заявка передана в КП (тех.)';


--
-- Name: COLUMN corp_tech_application.scp_rejection_comment; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.scp_rejection_comment IS 'Комментарий по отказу';


--
-- Name: COLUMN corp_tech_application.reason_refusal_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.reason_refusal_id IS 'Причина отказа Банка';


--
-- Name: COLUMN corp_tech_application.cred_depart_opinion_txt; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.cred_depart_opinion_txt IS 'Мнение кредитного подразделения';


--
-- Name: COLUMN corp_tech_application.is_start_bp_fa; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.is_start_bp_fa IS 'Запуск БП из ФА (тех.)';


--
-- Name: COLUMN corp_tech_application.is_start_bp_request_fa; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.is_start_bp_request_fa IS 'Запуск БП из доп. запроса ФА(тех.)';


--
-- Name: COLUMN corp_tech_application.is_simplified_fa; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.is_simplified_fa IS 'Упрощенный Финансовый анализ';


--
-- Name: COLUMN corp_tech_application.is_tech_ham_task_comp; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.is_tech_ham_task_comp IS 'Задача рук. КМ завершена (тех.)';


--
-- Name: COLUMN corp_tech_application.is_auto_sec_errors; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.is_auto_sec_errors IS 'Наличие ошибок (автосэб)';


--
-- Name: COLUMN corp_tech_application.pricing_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.pricing_id IS 'Ценообразование';


--
-- Name: COLUMN corp_tech_application.calc_risk_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.calc_risk_date IS 'Дата предварительной зоны риска';


--
-- Name: COLUMN corp_tech_application.collateral_cont_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.collateral_cont_id IS 'Контейнер с обеспечением';


--
-- Name: COLUMN corp_tech_application.resp_cond_coord; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.resp_cond_coord IS 'Голосующий (индивидуальные условия)';


--
-- Name: COLUMN corp_tech_application.is_fin_activ_newsub; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.is_fin_activ_newsub IS 'Финансирование деятельности в НС';


--
-- Name: COLUMN corp_tech_application.prelim_gsl_calc_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.prelim_gsl_calc_id IS 'Ссылка на предварительный расчет';


--
-- Name: COLUMN corp_tech_application.exp_fa_office_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.exp_fa_office_id IS 'Офис Экспертизы ФА';


--
-- Name: COLUMN corp_tech_application.scp_conclusion_comment; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.corp_tech_application.scp_conclusion_comment IS 'Вывод с комментарием для визуала заявки';


--
-- Name: count_turnover; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.count_turnover (
    id bigint NOT NULL,
    link_cnt_owner bigint,
    double_turn_balance smallint,
    finish_period timestamp(6) without time zone,
    count_months bigint,
    name character varying(2000),
    name__ru character varying(2000),
    name__en character varying(2000),
    st_period timestamp(6) without time zone,
    account_num_id bigint,
    account_source character varying(2000),
    turnover_debit numeric,
    turnover_credit numeric,
    is_check smallint,
    period_st_end character varying(2000),
    parent_link_count bigint,
    output_balance_debit numeric,
    output_balance_credit numeric,
    input_balance_debit numeric,
    input_balace_credit numeric,
    link_cred_doc_tur bigint,
    link_load_val_id bigint,
    link_partic_gr bigint,
    is_del smallint,
    correct_type bigint,
    tech_manual_vat smallint,
    vat numeric,
    bb_debet_id bigint,
    bb_cred_id bigint,
    bb_debet_reclass_id bigint,
    bb_cred_reclass_id bigint,
    out_bal_recl_debt numeric,
    out_bal_recl_cred numeric,
    bb_debet_input_id bigint,
    bb_cred_input_id bigint
);



--
-- Name: TABLE count_turnover; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.count_turnover IS 'Субконто счет (примитив), SysObjTypeEffective{id=2470407, ident=''COUNT_TURNOVER'', name=''Субконто счет (примитив)'', 2 attributes (2 actualizing)}';


--
-- Name: COLUMN count_turnover.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.id IS 'Код';


--
-- Name: COLUMN count_turnover.link_cnt_owner; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.link_cnt_owner IS 'Владелец';


--
-- Name: COLUMN count_turnover.double_turn_balance; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.double_turn_balance IS 'Дубликат';


--
-- Name: COLUMN count_turnover.finish_period; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.finish_period IS 'Конец периода';


--
-- Name: COLUMN count_turnover.count_months; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.count_months IS 'Количество месяцев в периоде';


--
-- Name: COLUMN count_turnover.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.name IS 'Наименование';


--
-- Name: COLUMN count_turnover.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.name__ru IS 'Наименование, languageSchema=ru';


--
-- Name: COLUMN count_turnover.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.name__en IS 'Наименование, languageSchema=en';


--
-- Name: COLUMN count_turnover.st_period; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.st_period IS 'Начало периода';


--
-- Name: COLUMN count_turnover.account_num_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.account_num_id IS 'Номер счета';


--
-- Name: COLUMN count_turnover.account_source; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.account_source IS 'Номер счета_источник';


--
-- Name: COLUMN count_turnover.turnover_debit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.turnover_debit IS 'Оборот по Дебету';


--
-- Name: COLUMN count_turnover.turnover_credit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.turnover_credit IS 'Оборот по Кредиту';


--
-- Name: COLUMN count_turnover.is_check; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.is_check IS 'Обработан';


--
-- Name: COLUMN count_turnover.period_st_end; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.period_st_end IS 'Период';


--
-- Name: COLUMN count_turnover.parent_link_count; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.parent_link_count IS 'Родительский номер счета';


--
-- Name: COLUMN count_turnover.output_balance_debit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.output_balance_debit IS 'Сальдо на конец периода (Дебет)';


--
-- Name: COLUMN count_turnover.output_balance_credit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.output_balance_credit IS 'Сальдо на конец периода (Кредит)';


--
-- Name: COLUMN count_turnover.input_balance_debit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.input_balance_debit IS 'Сальдо на начало периода (Дебет)';


--
-- Name: COLUMN count_turnover.input_balace_credit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.input_balace_credit IS 'Сальдо на начало периода (Кредит)';


--
-- Name: COLUMN count_turnover.link_cred_doc_tur; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.link_cred_doc_tur IS 'Ссылка на КЗ';


--
-- Name: COLUMN count_turnover.link_load_val_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.link_load_val_id IS 'Ссылка на контейнер загрузки';


--
-- Name: COLUMN count_turnover.link_partic_gr; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.link_partic_gr IS 'Ссылка на участника КЗ';


--
-- Name: COLUMN count_turnover.is_del; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.is_del IS 'Удален';


--
-- Name: COLUMN count_turnover.correct_type; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.correct_type IS 'Тип ОСВ';


--
-- Name: COLUMN count_turnover.tech_manual_vat; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.tech_manual_vat IS 'Технический признак ручного НДС';


--
-- Name: COLUMN count_turnover.vat; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.vat IS 'НДС';


--
-- Name: COLUMN count_turnover.bb_debet_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.bb_debet_id IS 'Статья (дебет)';


--
-- Name: COLUMN count_turnover.bb_cred_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.bb_cred_id IS 'Статья (кредит)';


--
-- Name: COLUMN count_turnover.bb_debet_reclass_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.bb_debet_reclass_id IS 'Статья (дебет) - рекласс';


--
-- Name: COLUMN count_turnover.bb_cred_reclass_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.bb_cred_reclass_id IS 'Статья (кредит) - рекласс';


--
-- Name: COLUMN count_turnover.out_bal_recl_debt; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.out_bal_recl_debt IS 'Сальдо на конец периода с учетом реклассификации (Дебет)';


--
-- Name: COLUMN count_turnover.out_bal_recl_cred; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.out_bal_recl_cred IS 'Сальдо на конец периода с учетом реклассификации (Кредит)';


--
-- Name: COLUMN count_turnover.bb_debet_input_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.bb_debet_input_id IS 'Статья (дебет, сальдо на начало)';


--
-- Name: COLUMN count_turnover.bb_cred_input_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.count_turnover.bb_cred_input_id IS 'Статья (кредит, сальдо на начало)';


--
-- Name: credit_contract; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.credit_contract (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    afl_doc_num character varying(2000),
    afl_doc_data timestamp without time zone,
    afp_state_id bigint,
    credit_contract_number character varying(2000),
    loan_term bigint,
    credit_amount numeric,
    special_purpose character varying(2000),
    quality_categor character varying(2000),
    financial_position character varying(2000),
    reserve_size numeric,
    link_customer_id bigint,
    aplication_id bigint,
    cred_interest_rate numeric,
    sel_curr bigint,
    credit_start_date timestamp(6) without time zone,
    credit_end_date timestamp(6) without time zone,
    check_account character varying(2000),
    days_delay_number character varying(2000),
    loan_classified character varying(2000),
    contract_group character varying(2000),
    date_loan_debt numeric,
    prof_judg_id bigint,
    contract_type character varying(100),
    credit_product character varying(100),
    applic_ko_kbkp_id bigint,
    is_closed smallint,
    pledge_contract_id bigint,
    wf_document_id bigint,
    cr_status_id bigint,
    is_guarantee smallint,
    lname character varying(2000),
    fname character varying(2000),
    mname character varying(2000),
    tabnum character varying(2000),
    sys_employee_id bigint,
    subsidy_prog_id bigint,
    individ_guarantee smallint,
    offer_ident character varying(2000),
    number_kk character varying(2000),
    protocol_date character varying(2000),
    subsidy_prog_str character varying(2000),
    bank_ident_number character varying(2000),
    tech_link_etl_susp_id bigint,
    suspension_na_id bigint,
    tech_link_etl_state_id bigint,
    appl_documentum_num character varying(2000),
    supplement_tech bigint,
    contracttype bigint,
    tech_selected_rz_id bigint,
    tech_selected_comm character varying(2000),
    tech_selected_meas_id bigint,
    yaig_base_code bigint,
    hand_suspension smallint,
    duration_over_on_date bigint,
    close_contract character varying(2000),
    fa_specialist character varying(2000),
    uid_credit character varying(2000),
    max_loan_amount_ever numeric,
    exite_date timestamp(6) without time zone,
    penalty_rate numeric,
    is_tranche_exist smallint,
    pers_emp_number character varying(2000)
);



--
-- Name: TABLE credit_contract; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.credit_contract IS 'Кредитный договор, SysObjTypeEffective{id=2106644, ident=''CREDIT_CONTRACT'', name=''Кредитный договор'', 17 attributes (17 actualizing)}';


--
-- Name: COLUMN credit_contract.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.id IS 'ID';


--
-- Name: COLUMN credit_contract.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN credit_contract.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN credit_contract.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.name IS 'Name';


--
-- Name: COLUMN credit_contract.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.create_date IS 'Create date';


--
-- Name: COLUMN credit_contract.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.type_id IS 'Тип объекта';


--
-- Name: COLUMN credit_contract.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.status IS 'Status';


--
-- Name: COLUMN credit_contract.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.org_id IS 'Подразделение';


--
-- Name: COLUMN credit_contract.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.user_id IS 'Пользователь';


--
-- Name: COLUMN credit_contract.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN credit_contract.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN credit_contract.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN credit_contract.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN credit_contract.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.is_system IS 'System object';


--
-- Name: COLUMN credit_contract.afl_doc_num; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.afl_doc_num IS 'Номер документа';


--
-- Name: COLUMN credit_contract.afl_doc_data; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.afl_doc_data IS 'Дата документа';


--
-- Name: COLUMN credit_contract.afp_state_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.afp_state_id IS 'Состояние';


--
-- Name: COLUMN credit_contract.credit_contract_number; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.credit_contract_number IS 'Номер кредитного договора';


--
-- Name: COLUMN credit_contract.loan_term; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.loan_term IS 'Срок кредитования (мес.)';


--
-- Name: COLUMN credit_contract.credit_amount; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.credit_amount IS 'Сумма кредита/лимита линии по договору (руб.)';


--
-- Name: COLUMN credit_contract.special_purpose; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.special_purpose IS 'Целевое назначение кредита по договору';


--
-- Name: COLUMN credit_contract.quality_categor; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.quality_categor IS 'Категория качества по ссуде/ Название ПОС';


--
-- Name: COLUMN credit_contract.financial_position; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.financial_position IS 'Финансовое положение (Хорошее, Среднее, Плохое)';


--
-- Name: COLUMN credit_contract.reserve_size; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.reserve_size IS 'Размер резерва (%)';


--
-- Name: COLUMN credit_contract.link_customer_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.link_customer_id IS 'Ссылка на клиента';


--
-- Name: COLUMN credit_contract.aplication_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.aplication_id IS 'Ссылка на микро заявку';


--
-- Name: COLUMN credit_contract.cred_interest_rate; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.cred_interest_rate IS 'Процентная ставка (%)';


--
-- Name: COLUMN credit_contract.sel_curr; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.sel_curr IS 'Валюта';


--
-- Name: COLUMN credit_contract.credit_start_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.credit_start_date IS 'Дата начало кредитования';


--
-- Name: COLUMN credit_contract.credit_end_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.credit_end_date IS 'Дата окончания кредитования';


--
-- Name: COLUMN credit_contract.check_account; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.check_account IS 'Расчетный счет';


--
-- Name: COLUMN credit_contract.days_delay_number; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.days_delay_number IS 'Количество дней прострочки';


--
-- Name: COLUMN credit_contract.loan_classified; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.loan_classified IS 'Классифайд кредитного договора';


--
-- Name: COLUMN credit_contract.contract_group; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.contract_group IS 'Контрактная группа';


--
-- Name: COLUMN credit_contract.date_loan_debt; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.date_loan_debt IS 'Остаток ссудной задолженности на дату отчета';


--
-- Name: COLUMN credit_contract.prof_judg_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.prof_judg_id IS 'Ссылка на индивид. профсуждение';


--
-- Name: COLUMN credit_contract.contract_type; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.contract_type IS 'Вид договора';


--
-- Name: COLUMN credit_contract.credit_product; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.credit_product IS 'Кредитный продукт';


--
-- Name: COLUMN credit_contract.applic_ko_kbkp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.applic_ko_kbkp_id IS 'Ссылка на микрозаявку КО/КБКП';


--
-- Name: COLUMN credit_contract.is_closed; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.is_closed IS 'Договор закрыт';


--
-- Name: COLUMN credit_contract.pledge_contract_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.pledge_contract_id IS 'Ссылка на договор залога';


--
-- Name: COLUMN credit_contract.wf_document_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.wf_document_id IS 'Связь с объектами из ДО. Документ';


--
-- Name: COLUMN credit_contract.cr_status_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.cr_status_id IS 'Статус договора';


--
-- Name: COLUMN credit_contract.is_guarantee; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.is_guarantee IS 'Наличие поручительства';


--
-- Name: COLUMN credit_contract.lname; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.lname IS 'Фамилия сотрудника';


--
-- Name: COLUMN credit_contract.fname; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.fname IS 'Отчество cотрудника';


--
-- Name: COLUMN credit_contract.mname; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.mname IS 'Имя cотрудника';


--
-- Name: COLUMN credit_contract.tabnum; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.tabnum IS 'Табельный номер сотрудника';


--
-- Name: COLUMN credit_contract.sys_employee_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.sys_employee_id IS 'Сотрудник';


--
-- Name: COLUMN credit_contract.subsidy_prog_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.subsidy_prog_id IS 'Программа субсидирования';


--
-- Name: COLUMN credit_contract.individ_guarantee; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.individ_guarantee IS 'Поручительство других лиц из онлайн заявки';


--
-- Name: COLUMN credit_contract.offer_ident; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.offer_ident IS 'Идентификатор предложения в Цифровом профиле';


--
-- Name: COLUMN credit_contract.number_kk; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.number_kk IS 'Номер протокола КК';


--
-- Name: COLUMN credit_contract.protocol_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.protocol_date IS 'Дата принятия решения уполномоченным органом';


--
-- Name: COLUMN credit_contract.subsidy_prog_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.subsidy_prog_str IS 'Программа субсидирования (Строка)';


--
-- Name: COLUMN credit_contract.bank_ident_number; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.bank_ident_number IS 'БИК';


--
-- Name: COLUMN credit_contract.tech_link_etl_susp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.tech_link_etl_susp_id IS 'Приостановление(тех.)Ссылка на etl приостановление/восстановление КД в НА';


--
-- Name: COLUMN credit_contract.suspension_na_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.suspension_na_id IS 'Состояние приостановления в НА';


--
-- Name: COLUMN credit_contract.tech_link_etl_state_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.tech_link_etl_state_id IS 'Приостановление(тех.)Ссылка на etl по получению состояния статуса приостановления';


--
-- Name: COLUMN credit_contract.appl_documentum_num; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.appl_documentum_num IS 'Номер заявки в Documentum';


--
-- Name: COLUMN credit_contract.supplement_tech; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.supplement_tech IS 'Дополнительное соглашение(Тех.)';


--
-- Name: COLUMN credit_contract.contracttype; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.contracttype IS '_Вид договора';


--
-- Name: COLUMN credit_contract.tech_selected_rz_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.tech_selected_rz_id IS 'Приостановление(тех.) выбранная зона';


--
-- Name: COLUMN credit_contract.tech_selected_comm; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.tech_selected_comm IS 'Приостановление(Тех.) Комментарий';


--
-- Name: COLUMN credit_contract.tech_selected_meas_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.tech_selected_meas_id IS 'Приостановление(тех.)Выбранная мера';


--
-- Name: COLUMN credit_contract.yaig_base_code; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.yaig_base_code IS 'Код базы НА';


--
-- Name: COLUMN credit_contract.hand_suspension; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.hand_suspension IS 'Ручная(мера)';


--
-- Name: COLUMN credit_contract.duration_over_on_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.duration_over_on_date IS 'Общая длительность просрочки на текущую дату';


--
-- Name: COLUMN credit_contract.close_contract; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.close_contract IS 'Наличие закрытых договоров';


--
-- Name: COLUMN credit_contract.fa_specialist; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.fa_specialist IS 'ФИО специалиста проводившего ФА';


--
-- Name: COLUMN credit_contract.uid_credit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.uid_credit IS 'UID Кредитного договора';


--
-- Name: COLUMN credit_contract.max_loan_amount_ever; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.max_loan_amount_ever IS 'Сумма полного лимита';


--
-- Name: COLUMN credit_contract.exite_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.exite_date IS 'Дата выхода из программы субсидирования';


--
-- Name: COLUMN credit_contract.penalty_rate; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.penalty_rate IS '%% ставка после выхода из программы субсидирования.';


--
-- Name: COLUMN credit_contract.is_tranche_exist; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.is_tranche_exist IS 'Были транши';


--
-- Name: COLUMN credit_contract.pers_emp_number; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.credit_contract.pers_emp_number IS 'Табельный номер сотрудника';


--
-- Name: dict_div_presence; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.dict_div_presence (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    ord bigint,
    nameregion character varying(2000),
    coderegion character varying(2000),
    div_presence smallint,
    stop_region smallint,
    stop_region_ko smallint,
    stop_region_fact smallint,
    name__en character varying(2000)
);



--
-- Name: TABLE dict_div_presence; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.dict_div_presence IS 'Справочник: регионы присутствия подразделений Банка, SysObjTypeEffective{id=2153884, ident=''DICT_DIV_PRESENCE'', name=''Справочник: регионы присутствия подразделений Банка'', 13 attributes (13 actualizing)}';


--
-- Name: COLUMN dict_div_presence.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_div_presence.id IS 'ID';


--
-- Name: COLUMN dict_div_presence.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_div_presence.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN dict_div_presence.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_div_presence.name IS 'Name';


--
-- Name: COLUMN dict_div_presence.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_div_presence.create_date IS 'Create date';


--
-- Name: COLUMN dict_div_presence.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_div_presence.type_id IS 'Тип объекта';


--
-- Name: COLUMN dict_div_presence.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_div_presence.status IS 'Status';


--
-- Name: COLUMN dict_div_presence.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_div_presence.org_id IS 'Подразделение';


--
-- Name: COLUMN dict_div_presence.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_div_presence.user_id IS 'Пользователь';


--
-- Name: COLUMN dict_div_presence.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_div_presence.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN dict_div_presence.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_div_presence.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN dict_div_presence.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_div_presence.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN dict_div_presence.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_div_presence.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN dict_div_presence.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_div_presence.is_system IS 'System object';


--
-- Name: COLUMN dict_div_presence.ord; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_div_presence.ord IS 'Порядок';


--
-- Name: COLUMN dict_div_presence.nameregion; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_div_presence.nameregion IS 'Наименование региона';


--
-- Name: COLUMN dict_div_presence.coderegion; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_div_presence.coderegion IS 'Код региона';


--
-- Name: COLUMN dict_div_presence.div_presence; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_div_presence.div_presence IS 'Признак присутствия Банка';


--
-- Name: COLUMN dict_div_presence.stop_region; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_div_presence.stop_region IS 'Стоп-регион для кредитования (ББКП)';


--
-- Name: COLUMN dict_div_presence.stop_region_ko; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_div_presence.stop_region_ko IS 'Стоп-регион для кредитования (КО)';


--
-- Name: COLUMN dict_div_presence.stop_region_fact; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_div_presence.stop_region_fact IS 'Стоп-регион для кредитования (Факторинг)';


--
-- Name: COLUMN dict_div_presence.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_div_presence.name__en IS 'Name, languageSchema=en';


--
-- Name: dict_product; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.dict_product (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    collateral_id bigint,
    guarantee_id bigint,
    departure_id bigint,
    attr_business_segment bigint,
    interest_penalties_id bigint,
    lending_type_id bigint,
    volume_revenue_id bigint,
    number_transactions_id bigint,
    amount_tender_loan_id bigint,
    payment_method_id bigint,
    overdraft_limit_id bigint,
    max_amount_id bigint,
    payment_interest_id bigint,
    possibility_delay smallint,
    payment_account smallint,
    early_rep_pos smallint,
    necessity_insurance smallint,
    payment_commission_id bigint,
    installment_payment smallint,
    rate_increase_1 smallint,
    id_855918 smallint,
    guarantee_1 smallint,
    min_sum numeric,
    type_of_guarantee_id bigint,
    product_relevance smallint,
    comissions_id bigint,
    ident character varying(2000),
    valid_decision bigint,
    indefinite_period smallint,
    form_issue_id bigint,
    part_big_buyer numeric,
    num_months_cashbox numeric,
    num_months_income numeric,
    count_income_month numeric,
    limit_over numeric,
    summ_tranche numeric,
    summ_limit numeric,
    term_limit_credit bigint,
    max_sum_credit numeric,
    min_sum_credit numeric,
    forfeight_id bigint,
    transfert_rate numeric,
    debt_on_tranche bigint,
    type_limit_over_id bigint,
    tech_decision_id bigint,
    credit_interest_rate numeric,
    dynam_type_id bigint,
    form_limit character varying(2000),
    loan_terms bigint,
    issue_limit_second character varying(10),
    issue_limit_first character varying(10),
    is_early_repay smallint,
    max_loan_term numeric,
    period_grace character varying(2000),
    card_validity character varying(2000),
    lp_product_code character varying(20),
    dbo_product_code character varying(20),
    cp_product_code character varying(20),
    limit_term character varying(10),
    finstar_product_code character varying(20),
    factoring_product_code character varying(2000),
    is_simplified_fa smallint,
    is_package smallint,
    name_contr_group character varying(2000),
    is_insurance_available smallint,
    is_amd_fill_mandatory smallint,
    is_new_prod_for_ns smallint,
    is_fin_activ_newsub smallint
);



--
-- Name: TABLE dict_product; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.dict_product IS 'Справочник: Продукт, SysObjTypeEffective{id=842664, ident=''DICT_PRODUCT'', name=''Справочник: Продукт'', 68 attributes (68 actualizing)}';


--
-- Name: COLUMN dict_product.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.id IS 'ID';


--
-- Name: COLUMN dict_product.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN dict_product.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN dict_product.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.name IS 'Name';


--
-- Name: COLUMN dict_product.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.create_date IS 'Create date';


--
-- Name: COLUMN dict_product.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.type_id IS 'Тип объекта';


--
-- Name: COLUMN dict_product.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.status IS 'Status';


--
-- Name: COLUMN dict_product.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.org_id IS 'Подразделение';


--
-- Name: COLUMN dict_product.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.user_id IS 'Пользователь';


--
-- Name: COLUMN dict_product.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN dict_product.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN dict_product.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN dict_product.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN dict_product.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.is_system IS 'System object';


--
-- Name: COLUMN dict_product.collateral_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.collateral_id IS 'Необходимость обеспечения';


--
-- Name: COLUMN dict_product.guarantee_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.guarantee_id IS 'Необходимость поручительства';


--
-- Name: COLUMN dict_product.departure_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.departure_id IS 'Выезд на место бизнеса заемщика';


--
-- Name: COLUMN dict_product.attr_business_segment; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.attr_business_segment IS 'Сегмент бизнеса клиента';


--
-- Name: COLUMN dict_product.interest_penalties_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.interest_penalties_id IS 'Возможность включения %, пеней и комиссий в погашаемую сумму';


--
-- Name: COLUMN dict_product.lending_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.lending_type_id IS 'Гос контракт. Вид кредитования';


--
-- Name: COLUMN dict_product.volume_revenue_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.volume_revenue_id IS 'Минимальный объем эквайринговой выручки';


--
-- Name: COLUMN dict_product.number_transactions_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.number_transactions_id IS 'Минимальное количество транзакций по картам';


--
-- Name: COLUMN dict_product.amount_tender_loan_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.amount_tender_loan_id IS 'Максимальная сумма тендерного кредита';


--
-- Name: COLUMN dict_product.payment_method_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.payment_method_id IS 'Наличие расчетного счета в "Открытие"';


--
-- Name: COLUMN dict_product.overdraft_limit_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.overdraft_limit_id IS 'Требование к лимиту овердрафта';


--
-- Name: COLUMN dict_product.max_amount_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.max_amount_id IS 'Ограничение максимального лимита';


--
-- Name: COLUMN dict_product.payment_interest_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.payment_interest_id IS 'Порядок уплаты процентов';


--
-- Name: COLUMN dict_product.possibility_delay; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.possibility_delay IS 'Возможность отсрочки по кредиту';


--
-- Name: COLUMN dict_product.payment_account; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.payment_account IS 'Необходимость наличия расчетного счета в ПАО Банк "ФК Открытие"';


--
-- Name: COLUMN dict_product.early_rep_pos; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.early_rep_pos IS 'Возможность досрочного погашения';


--
-- Name: COLUMN dict_product.necessity_insurance; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.necessity_insurance IS 'Требуется страхование';


--
-- Name: COLUMN dict_product.payment_commission_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.payment_commission_id IS 'Срок уплаты комиссии';


--
-- Name: COLUMN dict_product.installment_payment; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.installment_payment IS 'Допускается рассрочка платежа';


--
-- Name: COLUMN dict_product.rate_increase_1; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.rate_increase_1 IS 'Предусматривается повышение ставки';


--
-- Name: COLUMN dict_product.id_855918; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.id_855918 IS 'Требуется обеспечение';


--
-- Name: COLUMN dict_product.guarantee_1; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.guarantee_1 IS 'Требуется поручительство';


--
-- Name: COLUMN dict_product.min_sum; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.min_sum IS 'Минимальная сумма';


--
-- Name: COLUMN dict_product.type_of_guarantee_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.type_of_guarantee_id IS 'Вид гарантии';


--
-- Name: COLUMN dict_product.product_relevance; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.product_relevance IS 'Актуальность продукта';


--
-- Name: COLUMN dict_product.comissions_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.comissions_id IS 'Комиссии';


--
-- Name: COLUMN dict_product.ident; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.ident IS 'Сист. Идентификатор';


--
-- Name: COLUMN dict_product.valid_decision; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.valid_decision IS 'Срок действия положительного решения (день)';


--
-- Name: COLUMN dict_product.indefinite_period; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.indefinite_period IS 'Возможна выдача на неопределенный срок';


--
-- Name: COLUMN dict_product.form_issue_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.form_issue_id IS 'Форма выдачи';


--
-- Name: COLUMN dict_product.part_big_buyer; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.part_big_buyer IS 'Доля крупнейшего покупателя';


--
-- Name: COLUMN dict_product.num_months_cashbox; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.num_months_cashbox IS 'Количество месяцев ведения онлайн касс';


--
-- Name: COLUMN dict_product.num_months_income; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.num_months_income IS 'Количество месяцев по поступлениям на счет в ПСБ и (или) другие банки';


--
-- Name: COLUMN dict_product.count_income_month; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.count_income_month IS 'Количество поступлений на счет Клиента в каждом месяце';


--
-- Name: COLUMN dict_product.limit_over; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.limit_over IS 'Лимит овердрафта';


--
-- Name: COLUMN dict_product.summ_tranche; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.summ_tranche IS 'Сумма транша';


--
-- Name: COLUMN dict_product.summ_limit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.summ_limit IS 'Сумма лимита';


--
-- Name: COLUMN dict_product.term_limit_credit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.term_limit_credit IS 'Период выборки лимита кредитной линии';


--
-- Name: COLUMN dict_product.max_sum_credit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.max_sum_credit IS 'Максимальная сумма кредитного продукта';


--
-- Name: COLUMN dict_product.min_sum_credit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.min_sum_credit IS 'Минимальная сумма кредитного продукта';


--
-- Name: COLUMN dict_product.forfeight_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.forfeight_id IS 'Неустойки';


--
-- Name: COLUMN dict_product.transfert_rate; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.transfert_rate IS 'Ставка трансферта';


--
-- Name: COLUMN dict_product.debt_on_tranche; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.debt_on_tranche IS 'Срок задолженности по одному траншу';


--
-- Name: COLUMN dict_product.type_limit_over_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.type_limit_over_id IS 'Тип лимита овердрафта';


--
-- Name: COLUMN dict_product.tech_decision_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.tech_decision_id IS 'Технология принятия решения';


--
-- Name: COLUMN dict_product.credit_interest_rate; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.credit_interest_rate IS 'Процентная ставка';


--
-- Name: COLUMN dict_product.dynam_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.dynam_type_id IS 'Тип динамики';


--
-- Name: COLUMN dict_product.form_limit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.form_limit IS 'Форма лимита';


--
-- Name: COLUMN dict_product.loan_terms; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.loan_terms IS 'Срок лимита';


--
-- Name: COLUMN dict_product.issue_limit_second; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.issue_limit_second IS 'Срок транша 2';


--
-- Name: COLUMN dict_product.issue_limit_first; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.issue_limit_first IS 'Срок транша 1';


--
-- Name: COLUMN dict_product.is_early_repay; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.is_early_repay IS 'Возможно досрочное погашение(ЦКП)';


--
-- Name: COLUMN dict_product.max_loan_term; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.max_loan_term IS 'Максимальный срок кредита (мес)';


--
-- Name: COLUMN dict_product.period_grace; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.period_grace IS 'Грейс';


--
-- Name: COLUMN dict_product.card_validity; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.card_validity IS 'Срок действия карты';


--
-- Name: COLUMN dict_product.lp_product_code; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.lp_product_code IS 'Код продукта в LP';


--
-- Name: COLUMN dict_product.dbo_product_code; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.dbo_product_code IS 'Код продукта в ДБО';


--
-- Name: COLUMN dict_product.cp_product_code; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.cp_product_code IS 'Код продукта в ЦП';


--
-- Name: COLUMN dict_product.limit_term; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.limit_term IS 'Срок договора';


--
-- Name: COLUMN dict_product.finstar_product_code; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.finstar_product_code IS 'Код продукта в Финстар';


--
-- Name: COLUMN dict_product.factoring_product_code; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.factoring_product_code IS 'Код продукта факторинга';


--
-- Name: COLUMN dict_product.is_simplified_fa; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.is_simplified_fa IS 'Упрощенный Финансовый анализ';


--
-- Name: COLUMN dict_product.is_package; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.is_package IS 'Пакетный продукт';


--
-- Name: COLUMN dict_product.name_contr_group; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.name_contr_group IS 'Наименование контрактной группы';


--
-- Name: COLUMN dict_product.is_insurance_available; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.is_insurance_available IS 'Доступно страхование';


--
-- Name: COLUMN dict_product.is_amd_fill_mandatory; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.is_amd_fill_mandatory IS 'Обязательное заполнение размера резерва и категории качества в РУМ';


--
-- Name: COLUMN dict_product.is_new_prod_for_ns; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.is_new_prod_for_ns IS 'Новый продукт для НС';


--
-- Name: COLUMN dict_product.is_fin_activ_newsub; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.dict_product.is_fin_activ_newsub IS 'Финансирование деятельности в НС';


--
-- Name: fs_file; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.fs_file (
    id bigint NOT NULL,
    name character varying(2000) NOT NULL,
    type_id bigint NOT NULL,
    org_id bigint NOT NULL,
    status smallint NOT NULL,
    create_date timestamp without time zone NOT NULL,
    user_id bigint NOT NULL,
    ff_type_id bigint NOT NULL,
    ff_storage_id bigint NOT NULL,
    ff_inner_name character varying(2000) NOT NULL,
    ff_body_size bigint NOT NULL,
    ff_kind_id bigint NOT NULL,
    ff_note character varying(2000),
    ff_actual_end_date timestamp without time zone,
    name__en character varying(2000),
    name__ru character varying(2000),
    created_emp_id bigint NOT NULL,
    last_modified_user_id bigint NOT NULL,
    last_modified_emp_id bigint NOT NULL,
    last_modified_date timestamp without time zone NOT NULL,
    is_system smallint,
    ff_parent_object bigint,
    ff_is_stored smallint,
    ff_id_881754 timestamp(6) without time zone,
    ff_id_881762 character varying(2000),
    ff_id_881752 timestamp(6) without time zone,
    ff_fs_is_preview_file smallint,
    ff_fs_file_name character varying(2000),
    ff_fv_date_from timestamp(6) without time zone,
    ff_fv_date_to timestamp(6) without time zone,
    ff_body_uuid character varying(2000)
);



--
-- Name: TABLE fs_file; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.fs_file IS 'Описание файла';


--
-- Name: COLUMN fs_file.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.id IS 'Код, SysTypeAttrEffective{} AbstractAttrEffective{id=101002, ident=''ID''}';


--
-- Name: COLUMN fs_file.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.name IS 'Name';


--
-- Name: COLUMN fs_file.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.type_id IS 'Тип объекта';


--
-- Name: COLUMN fs_file.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.org_id IS 'Подразделение';


--
-- Name: COLUMN fs_file.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.status IS 'Status';


--
-- Name: COLUMN fs_file.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.create_date IS 'Create date';


--
-- Name: COLUMN fs_file.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.user_id IS 'Пользователь';


--
-- Name: COLUMN fs_file.ff_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.ff_type_id IS 'Тип файла';


--
-- Name: COLUMN fs_file.ff_storage_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.ff_storage_id IS 'Хранилище';


--
-- Name: COLUMN fs_file.ff_inner_name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.ff_inner_name IS 'Внутреннее имя файла';


--
-- Name: COLUMN fs_file.ff_body_size; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.ff_body_size IS 'Размер файла';


--
-- Name: COLUMN fs_file.ff_kind_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.ff_kind_id IS 'Классификация';


--
-- Name: COLUMN fs_file.ff_note; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.ff_note IS 'Описание';


--
-- Name: COLUMN fs_file.ff_actual_end_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.ff_actual_end_date IS 'Срок актуальности';


--
-- Name: COLUMN fs_file.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN fs_file.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN fs_file.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN fs_file.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN fs_file.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN fs_file.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN fs_file.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.is_system IS 'System object';


--
-- Name: COLUMN fs_file.ff_parent_object; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.ff_parent_object IS 'Ссылка на родительский объект';


--
-- Name: COLUMN fs_file.ff_is_stored; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.ff_is_stored IS 'Файл сохранен в хранилище';


--
-- Name: COLUMN fs_file.ff_id_881754; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.ff_id_881754 IS 'Дата размещения документа';


--
-- Name: COLUMN fs_file.ff_id_881762; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.ff_id_881762 IS 'Родительская классификация';


--
-- Name: COLUMN fs_file.ff_id_881752; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.ff_id_881752 IS 'Дата документа';


--
-- Name: COLUMN fs_file.ff_fs_is_preview_file; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.ff_fs_is_preview_file IS 'Открыть на предпросмотр Edoc';


--
-- Name: COLUMN fs_file.ff_fs_file_name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.ff_fs_file_name IS 'Наименование без расширения';


--
-- Name: COLUMN fs_file.ff_fv_date_from; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.ff_fv_date_from IS 'Дата начала действия';


--
-- Name: COLUMN fs_file.ff_fv_date_to; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.ff_fv_date_to IS 'Дата окончания действия';


--
-- Name: COLUMN fs_file.ff_body_uuid; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.fs_file.ff_body_uuid IS 'UUID для индикации о замене тела файла';


--
-- Name: ic_application; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.ic_application (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    afl_doc_num character varying(2000),
    afl_doc_data timestamp without time zone,
    afp_state_id bigint,
    initiator_id bigint,
    emp_id bigint,
    processing_steps_id bigint,
    temp_cont_turn bigint,
    cr_id bigint,
    scp_tech_ctredit bigint,
    scp_business_segment bigint,
    client_type_id bigint,
    gsl_data_cont_id bigint,
    scp_arm_manager_id bigint,
    req_type_id bigint,
    credit_logic_id bigint,
    gsl_limit numeric,
    pricing_id bigint,
    scp_gsl_name_str character varying(2000),
    resp_cond_coord bigint,
    curator_head_id bigint,
    resp_cond_coord_str character varying(2000),
    is_auto_creation smallint,
    industry_code_id bigint,
    app_obj_id bigint,
    deleg_region_id bigint,
    scp_proc_steds_id bigint,
    is_directed_to_process smallint,
    scp_product_str character varying(2000),
    is_state_program smallint,
    cred_technology_str character varying(2000),
    is_na_active smallint,
    is_fin_activ_newsub smallint,
    prelim_gsl_calc_id bigint,
    scp_rejection_client_id bigint,
    reason_refusal_id bigint,
    is_ic_withdrawn smallint,
    scp_rejection_comment text,
    is_button_refuse smallint
);



--
-- Name: TABLE ic_application; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.ic_application IS 'ИУ. Заявка, SysObjTypeEffective{id=8942829, ident=''IC_APPLICATION'', name=''ИУ. Заявка'', 54 attributes (54 actualizing)}';


--
-- Name: COLUMN ic_application.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.id IS 'ID';


--
-- Name: COLUMN ic_application.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN ic_application.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN ic_application.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.name IS 'Name';


--
-- Name: COLUMN ic_application.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.create_date IS 'Create date';


--
-- Name: COLUMN ic_application.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.type_id IS 'Тип объекта';


--
-- Name: COLUMN ic_application.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.status IS 'Status';


--
-- Name: COLUMN ic_application.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.org_id IS 'Подразделение';


--
-- Name: COLUMN ic_application.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.user_id IS 'Пользователь';


--
-- Name: COLUMN ic_application.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN ic_application.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN ic_application.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN ic_application.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN ic_application.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.is_system IS 'System object';


--
-- Name: COLUMN ic_application.afl_doc_num; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.afl_doc_num IS 'Номер документа';


--
-- Name: COLUMN ic_application.afl_doc_data; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.afl_doc_data IS 'Дата документа';


--
-- Name: COLUMN ic_application.afp_state_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.afp_state_id IS 'Состояние';


--
-- Name: COLUMN ic_application.initiator_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.initiator_id IS 'Клиент';


--
-- Name: COLUMN ic_application.emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.emp_id IS 'Ответственный менеджер';


--
-- Name: COLUMN ic_application.processing_steps_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.processing_steps_id IS 'Текущий этап обработки';


--
-- Name: COLUMN ic_application.temp_cont_turn; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.temp_cont_turn IS 'Промежуточный контейнер загрузки ОСВ';


--
-- Name: COLUMN ic_application.cr_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.cr_id IS 'Ссылка на КЗ';


--
-- Name: COLUMN ic_application.scp_tech_ctredit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.scp_tech_ctredit IS 'Технология кредитования';


--
-- Name: COLUMN ic_application.scp_business_segment; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.scp_business_segment IS 'Клиентский сегмент';


--
-- Name: COLUMN ic_application.client_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.client_type_id IS 'Тип клиента';


--
-- Name: COLUMN ic_application.gsl_data_cont_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.gsl_data_cont_id IS 'Ссылка на контейнер данных ГСЛ';


--
-- Name: COLUMN ic_application.scp_arm_manager_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.scp_arm_manager_id IS 'Сотрудник АРМ';


--
-- Name: COLUMN ic_application.req_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.req_type_id IS 'Класс заявки';


--
-- Name: COLUMN ic_application.credit_logic_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.credit_logic_id IS 'Логика кредитования';


--
-- Name: COLUMN ic_application.gsl_limit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.gsl_limit IS 'Общий лимит по ГСЛ';


--
-- Name: COLUMN ic_application.pricing_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.pricing_id IS 'Ценообразование';


--
-- Name: COLUMN ic_application.scp_gsl_name_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.scp_gsl_name_str IS 'Наименование ГСЛ';


--
-- Name: COLUMN ic_application.resp_cond_coord; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.resp_cond_coord IS 'Голосующий (индивидуальные условия)';


--
-- Name: COLUMN ic_application.curator_head_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.curator_head_id IS 'Куратор ГО';


--
-- Name: COLUMN ic_application.resp_cond_coord_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.resp_cond_coord_str IS '_Голосующий (строка)';


--
-- Name: COLUMN ic_application.is_auto_creation; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.is_auto_creation IS 'Создана автоматически';


--
-- Name: COLUMN ic_application.industry_code_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.industry_code_id IS 'Отрасль клиента';


--
-- Name: COLUMN ic_application.app_obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.app_obj_id IS 'Ссылка на заявку СКП (для автоматически созданных)';


--
-- Name: COLUMN ic_application.deleg_region_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.deleg_region_id IS 'Регион клиента';


--
-- Name: COLUMN ic_application.scp_proc_steds_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.scp_proc_steds_id IS 'Этап обработки';


--
-- Name: COLUMN ic_application.is_directed_to_process; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.is_directed_to_process IS 'Направлена по процессу';


--
-- Name: COLUMN ic_application.scp_product_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.scp_product_str IS 'Продукт (строка)';


--
-- Name: COLUMN ic_application.is_state_program; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.is_state_program IS 'Применение госпрограммы';


--
-- Name: COLUMN ic_application.cred_technology_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.cred_technology_str IS 'Технология кредитования (строка)';


--
-- Name: COLUMN ic_application.is_na_active; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.is_na_active IS 'Интеграция с НА по получению кредитных обязательств активна';


--
-- Name: COLUMN ic_application.is_fin_activ_newsub; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.is_fin_activ_newsub IS 'Финансирование деятельности в НС';


--
-- Name: COLUMN ic_application.prelim_gsl_calc_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.prelim_gsl_calc_id IS 'Ссылка на предварительный расчет';


--
-- Name: COLUMN ic_application.scp_rejection_client_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.scp_rejection_client_id IS 'Причина отказа Клиента';


--
-- Name: COLUMN ic_application.reason_refusal_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.reason_refusal_id IS 'Причина отказа Банка';


--
-- Name: COLUMN ic_application.is_ic_withdrawn; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.is_ic_withdrawn IS 'Отзыв Индивидуальных условий';


--
-- Name: COLUMN ic_application.scp_rejection_comment; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.scp_rejection_comment IS 'Комментарий по отказу';


--
-- Name: COLUMN ic_application.is_button_refuse; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ic_application.is_button_refuse IS 'Отказ по кнопке';


--
-- Name: mler_application; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.mler_application (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    afl_doc_num character varying(2000),
    afl_doc_data timestamp without time zone,
    afp_state_id bigint,
    initiator_id bigint,
    emp_id bigint,
    processing_steps_id bigint,
    temp_cont_turn bigint,
    cr_id bigint,
    scp_tech_ctredit bigint,
    scp_business_segment bigint,
    client_type_id bigint,
    lim_sum numeric,
    gsl_data_cont_id bigint,
    scp_cheif_cm_id bigint,
    mler_decis_id bigint,
    mler_client_name character varying(2000),
    is_out_app smallint,
    chief_initiator_id bigint,
    req_type_id bigint,
    execut_admin_id bigint,
    mler_signer_id bigint,
    client_section_id bigint,
    project_decis_id bigint,
    date_amd_decision timestamp(6) without time zone,
    num_amd_decision character varying(2000),
    credit_logic_id bigint,
    gsl_limit numeric,
    loan_terms bigint,
    decis_use_limit smallint,
    signed_risks_date timestamp(6) without time zone,
    deleg_region_id bigint,
    decis_use_limit_text text,
    is_decision_signed smallint,
    is_decision_approved smallint,
    scp_gsl_name_str character varying(2000),
    scp_proc_steds_id bigint,
    industry_code_id bigint,
    scp_product_str character varying(2000),
    is_state_program smallint,
    cred_technology_str character varying(2000),
    app_product_id bigint,
    is_fin_activ_newsub smallint,
    prelim_gsl_calc_id bigint
);



--
-- Name: TABLE mler_application; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.mler_application IS 'МЮЭР. Заявка, SysObjTypeEffective{id=8751954, ident=''MLER_APPLICATION'', name=''МЮЭР. Заявка'', 39 attributes (39 actualizing)}';


--
-- Name: COLUMN mler_application.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.id IS 'ID';


--
-- Name: COLUMN mler_application.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN mler_application.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN mler_application.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.name IS 'Name';


--
-- Name: COLUMN mler_application.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.create_date IS 'Create date';


--
-- Name: COLUMN mler_application.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.type_id IS 'Тип объекта';


--
-- Name: COLUMN mler_application.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.status IS 'Status';


--
-- Name: COLUMN mler_application.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.org_id IS 'Подразделение';


--
-- Name: COLUMN mler_application.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.user_id IS 'Пользователь';


--
-- Name: COLUMN mler_application.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN mler_application.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN mler_application.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN mler_application.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN mler_application.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.is_system IS 'System object';


--
-- Name: COLUMN mler_application.afl_doc_num; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.afl_doc_num IS 'Номер документа';


--
-- Name: COLUMN mler_application.afl_doc_data; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.afl_doc_data IS 'Дата документа';


--
-- Name: COLUMN mler_application.afp_state_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.afp_state_id IS 'Состояние';


--
-- Name: COLUMN mler_application.initiator_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.initiator_id IS 'Клиент';


--
-- Name: COLUMN mler_application.emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.emp_id IS 'Ответственный менеджер';


--
-- Name: COLUMN mler_application.processing_steps_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.processing_steps_id IS 'Текущий этап обработки';


--
-- Name: COLUMN mler_application.temp_cont_turn; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.temp_cont_turn IS 'Промежуточный контейнер загрузки ОСВ';


--
-- Name: COLUMN mler_application.cr_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.cr_id IS 'Ссылка на КЗ';


--
-- Name: COLUMN mler_application.scp_tech_ctredit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.scp_tech_ctredit IS 'Технология кредитования';


--
-- Name: COLUMN mler_application.scp_business_segment; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.scp_business_segment IS 'Клиентский сегмент';


--
-- Name: COLUMN mler_application.client_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.client_type_id IS 'Тип клиента';


--
-- Name: COLUMN mler_application.lim_sum; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.lim_sum IS 'Сумма заявки';


--
-- Name: COLUMN mler_application.gsl_data_cont_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.gsl_data_cont_id IS 'Ссылка на контейнер данных ГСЛ';


--
-- Name: COLUMN mler_application.scp_cheif_cm_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.scp_cheif_cm_id IS 'Руководитель КМ';


--
-- Name: COLUMN mler_application.mler_decis_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.mler_decis_id IS 'Принятое решение';


--
-- Name: COLUMN mler_application.mler_client_name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.mler_client_name IS '_Владелец лимита (не исп)';


--
-- Name: COLUMN mler_application.is_out_app; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.is_out_app IS 'Заявка есть в Гриндате';


--
-- Name: COLUMN mler_application.chief_initiator_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.chief_initiator_id IS 'Руководитель инициатора';


--
-- Name: COLUMN mler_application.req_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.req_type_id IS 'Класс заявки';


--
-- Name: COLUMN mler_application.execut_admin_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.execut_admin_id IS 'Сотрудник СМБ ДРСМБ';


--
-- Name: COLUMN mler_application.mler_signer_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.mler_signer_id IS 'Подписант (УО)';


--
-- Name: COLUMN mler_application.client_section_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.client_section_id IS 'Сегмент в соответствии с ВКР';


--
-- Name: COLUMN mler_application.project_decis_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.project_decis_id IS 'Ссылка на проект решения';


--
-- Name: COLUMN mler_application.date_amd_decision; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.date_amd_decision IS 'Дата решения';


--
-- Name: COLUMN mler_application.num_amd_decision; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.num_amd_decision IS 'Номер решения (строка)';


--
-- Name: COLUMN mler_application.credit_logic_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.credit_logic_id IS 'Логика кредитования';


--
-- Name: COLUMN mler_application.gsl_limit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.gsl_limit IS 'Сумма общего лимита';


--
-- Name: COLUMN mler_application.loan_terms; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.loan_terms IS 'Срок лимита';


--
-- Name: COLUMN mler_application.decis_use_limit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.decis_use_limit IS 'Ограничение по применению Решения';


--
-- Name: COLUMN mler_application.signed_risks_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.signed_risks_date IS 'Дата подписания';


--
-- Name: COLUMN mler_application.deleg_region_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.deleg_region_id IS 'Регион клиента';


--
-- Name: COLUMN mler_application.decis_use_limit_text; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.decis_use_limit_text IS 'Ограничение по применению Решения (текст)';


--
-- Name: COLUMN mler_application.is_decision_signed; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.is_decision_signed IS 'Решение подписано';


--
-- Name: COLUMN mler_application.is_decision_approved; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.is_decision_approved IS 'Решение согласовано КМ';


--
-- Name: COLUMN mler_application.scp_gsl_name_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.scp_gsl_name_str IS 'Владелец лимита';


--
-- Name: COLUMN mler_application.scp_proc_steds_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.scp_proc_steds_id IS 'Этап обработки';


--
-- Name: COLUMN mler_application.industry_code_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.industry_code_id IS 'Отрасль клиента';


--
-- Name: COLUMN mler_application.scp_product_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.scp_product_str IS 'Продукт (строка)';


--
-- Name: COLUMN mler_application.is_state_program; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.is_state_program IS 'Применение госпрограммы';


--
-- Name: COLUMN mler_application.cred_technology_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.cred_technology_str IS 'Технология кредитования (строка)';


--
-- Name: COLUMN mler_application.app_product_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.app_product_id IS 'Продукт';


--
-- Name: COLUMN mler_application.is_fin_activ_newsub; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.is_fin_activ_newsub IS 'Финансирование деятельности в НС';


--
-- Name: COLUMN mler_application.prelim_gsl_calc_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.mler_application.prelim_gsl_calc_id IS 'Ссылка на предварительный расчет';


--
-- Name: ms_0golbfqyrdq4im6jf6ajivwy9; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.ms_0golbfqyrdq4im6jf6ajivwy9 (
    id bigint NOT NULL,
    obj_id bigint NOT NULL
);



--
-- Name: COLUMN ms_0golbfqyrdq4im6jf6ajivwy9.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ms_0golbfqyrdq4im6jf6ajivwy9.id IS 'ID';


--
-- Name: COLUMN ms_0golbfqyrdq4im6jf6ajivwy9.obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ms_0golbfqyrdq4im6jf6ajivwy9.obj_id IS 'Link to object, sysObjTypeAttr 3712195';


--
-- Name: ms_0n8ohjyx7oszo6a47ca9g0s6f; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.ms_0n8ohjyx7oszo6a47ca9g0s6f (
    id bigint NOT NULL,
    obj_id bigint NOT NULL
);



--
-- Name: TABLE ms_0n8ohjyx7oszo6a47ca9g0s6f; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.ms_0n8ohjyx7oszo6a47ca9g0s6f IS 'MultiSelect container: SCP_STATE_ID_MS. ObjType: КТ. Заявка , SysObjTypeEffective{id=8751785, ident=''CORP_TECH_APPLICATION'', name=''КТ. Заявка '', 56 attributes (0 actualizing)}';


--
-- Name: COLUMN ms_0n8ohjyx7oszo6a47ca9g0s6f.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ms_0n8ohjyx7oszo6a47ca9g0s6f.id IS 'ID';


--
-- Name: COLUMN ms_0n8ohjyx7oszo6a47ca9g0s6f.obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ms_0n8ohjyx7oszo6a47ca9g0s6f.obj_id IS 'Link to object, sysObjTypeAttr 8751793';


--
-- Name: ms_0oc5mpme8nklimjy77sai9gf1; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.ms_0oc5mpme8nklimjy77sai9gf1 (
    id bigint NOT NULL,
    obj_id bigint NOT NULL
);



--
-- Name: COLUMN ms_0oc5mpme8nklimjy77sai9gf1.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ms_0oc5mpme8nklimjy77sai9gf1.id IS 'ID';


--
-- Name: COLUMN ms_0oc5mpme8nklimjy77sai9gf1.obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ms_0oc5mpme8nklimjy77sai9gf1.obj_id IS 'Link to object, sysObjTypeAttr 3714869';


--
-- Name: ms_1fd5jp86pabxu9na4knwphvyr; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.ms_1fd5jp86pabxu9na4knwphvyr (
    id bigint NOT NULL,
    obj_id bigint NOT NULL
);



--
-- Name: COLUMN ms_1fd5jp86pabxu9na4knwphvyr.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ms_1fd5jp86pabxu9na4knwphvyr.id IS 'ID';


--
-- Name: COLUMN ms_1fd5jp86pabxu9na4knwphvyr.obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ms_1fd5jp86pabxu9na4knwphvyr.obj_id IS 'Link to object, sysObjTypeAttr 3714881';


--
-- Name: ms_333s6j5jn97srp008gyi3zueo; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.ms_333s6j5jn97srp008gyi3zueo (
    id bigint NOT NULL,
    obj_id bigint NOT NULL
);



--
-- Name: COLUMN ms_333s6j5jn97srp008gyi3zueo.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ms_333s6j5jn97srp008gyi3zueo.id IS 'ID';


--
-- Name: COLUMN ms_333s6j5jn97srp008gyi3zueo.obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ms_333s6j5jn97srp008gyi3zueo.obj_id IS 'Link to object, sysObjTypeAttr 8751957';


--
-- Name: ms_39qrctc1n8efr9axiukjssgzl; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.ms_39qrctc1n8efr9axiukjssgzl (
    id bigint NOT NULL,
    obj_id bigint NOT NULL
);



--
-- Name: COLUMN ms_39qrctc1n8efr9axiukjssgzl.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ms_39qrctc1n8efr9axiukjssgzl.id IS 'ID';


--
-- Name: COLUMN ms_39qrctc1n8efr9axiukjssgzl.obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ms_39qrctc1n8efr9axiukjssgzl.obj_id IS 'Link to object, sysObjTypeAttr 3817898';


--
-- Name: ms_64cm5ded37z58x0fyt5lgvhc7; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.ms_64cm5ded37z58x0fyt5lgvhc7 (
    id bigint NOT NULL,
    obj_id bigint NOT NULL
);



--
-- Name: TABLE ms_64cm5ded37z58x0fyt5lgvhc7; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.ms_64cm5ded37z58x0fyt5lgvhc7 IS 'MultiSelect container: OFFICE_FIX_MS. ObjType: СКП. Справочник: Офисы РЦБ, SysObjTypeEffective{id=4217070, ident=''SCP_DICT_RSC_OFFICE'', name=''СКП. Справочник: Офисы РЦБ'', 16 attributes (0 actualizing)}';


--
-- Name: COLUMN ms_64cm5ded37z58x0fyt5lgvhc7.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ms_64cm5ded37z58x0fyt5lgvhc7.id IS 'ID';


--
-- Name: COLUMN ms_64cm5ded37z58x0fyt5lgvhc7.obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ms_64cm5ded37z58x0fyt5lgvhc7.obj_id IS 'Link to object, sysObjTypeAttr 4217072';


--
-- Name: ms_965j58mgwkpomnuooc29dlq9f; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.ms_965j58mgwkpomnuooc29dlq9f (
    id bigint NOT NULL,
    obj_id bigint NOT NULL
);



--
-- Name: COLUMN ms_965j58mgwkpomnuooc29dlq9f.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ms_965j58mgwkpomnuooc29dlq9f.id IS 'ID';


--
-- Name: COLUMN ms_965j58mgwkpomnuooc29dlq9f.obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ms_965j58mgwkpomnuooc29dlq9f.obj_id IS 'Link to object, sysObjTypeAttr 9029886';


--
-- Name: ms_9k60rv4p0oaf3c702f2l1gj77; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.ms_9k60rv4p0oaf3c702f2l1gj77 (
    id bigint NOT NULL,
    obj_id bigint NOT NULL
);



--
-- Name: COLUMN ms_9k60rv4p0oaf3c702f2l1gj77.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ms_9k60rv4p0oaf3c702f2l1gj77.id IS 'ID';


--
-- Name: COLUMN ms_9k60rv4p0oaf3c702f2l1gj77.obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ms_9k60rv4p0oaf3c702f2l1gj77.obj_id IS 'Link to object, sysObjTypeAttr 9029887';


--
-- Name: ms_d1oakp9uq175ak3dbhpzbu81d; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.ms_d1oakp9uq175ak3dbhpzbu81d (
    id bigint NOT NULL,
    obj_id bigint NOT NULL
);



--
-- Name: COLUMN ms_d1oakp9uq175ak3dbhpzbu81d.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ms_d1oakp9uq175ak3dbhpzbu81d.id IS 'ID';


--
-- Name: COLUMN ms_d1oakp9uq175ak3dbhpzbu81d.obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ms_d1oakp9uq175ak3dbhpzbu81d.obj_id IS 'Link to object, sysObjTypeAttr 8775851';


--
-- Name: ms_dlggiqkhqj46rhq1lrgryim7c; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.ms_dlggiqkhqj46rhq1lrgryim7c (
    id bigint NOT NULL,
    obj_id bigint NOT NULL
);



--
-- Name: COLUMN ms_dlggiqkhqj46rhq1lrgryim7c.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ms_dlggiqkhqj46rhq1lrgryim7c.id IS 'ID';


--
-- Name: COLUMN ms_dlggiqkhqj46rhq1lrgryim7c.obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ms_dlggiqkhqj46rhq1lrgryim7c.obj_id IS 'Link to object, sysObjTypeAttr 9035998';


--
-- Name: ms_dxsh6488ihf77xmsd43dwby6k; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.ms_dxsh6488ihf77xmsd43dwby6k (
    id bigint NOT NULL,
    obj_id bigint NOT NULL
);



--
-- Name: COLUMN ms_dxsh6488ihf77xmsd43dwby6k.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ms_dxsh6488ihf77xmsd43dwby6k.id IS 'ID';


--
-- Name: COLUMN ms_dxsh6488ihf77xmsd43dwby6k.obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ms_dxsh6488ihf77xmsd43dwby6k.obj_id IS 'Link to object, sysObjTypeAttr 3190710';


--
-- Name: ms_e5lum3lbateqhx8wkgtstxdf9; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.ms_e5lum3lbateqhx8wkgtstxdf9 (
    id bigint NOT NULL,
    obj_id bigint NOT NULL
);



--
-- Name: COLUMN ms_e5lum3lbateqhx8wkgtstxdf9.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ms_e5lum3lbateqhx8wkgtstxdf9.id IS 'ID';


--
-- Name: COLUMN ms_e5lum3lbateqhx8wkgtstxdf9.obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.ms_e5lum3lbateqhx8wkgtstxdf9.obj_id IS 'Link to object, sysObjTypeAttr 8751779';


--
-- Name: offices_psb; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.offices_psb (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    parent_org_id bigint,
    short_name__ru character varying(2000),
    short_name__en character varying(2000),
    short_name character varying(2000),
    view_id bigint,
    main_org bigint,
    org_company bigint,
    ident character varying(2000),
    office_id character varying(2000),
    office_name character varying(2000),
    office_address character varying(2000),
    office_code character varying(2000),
    office_date_from timestamp(6) without time zone,
    office_date_to timestamp(6) without time zone,
    office_type character varying(2000),
    office_status character varying(2000),
    office_sign_active smallint,
    psb_dep_org bigint,
    rout_office_id bigint,
    lvl_org bigint,
    feat_org smallint,
    is_region smallint,
    work_org smallint,
    etl_marker_org smallint,
    id_parent_org bigint,
    id_depart_org bigint,
    id_parent_corr_org bigint
);



--
-- Name: TABLE offices_psb; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.offices_psb IS 'Офисы в ПСБ, SysObjTypeEffective{id=2133981, ident=''OFFICES_PSB'', name=''Офисы в ПСБ'', 18 attributes (18 actualizing)}';


--
-- Name: COLUMN offices_psb.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.id IS 'ID';


--
-- Name: COLUMN offices_psb.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN offices_psb.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN offices_psb.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.name IS 'Name';


--
-- Name: COLUMN offices_psb.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.create_date IS 'Create date';


--
-- Name: COLUMN offices_psb.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.type_id IS 'Тип объекта';


--
-- Name: COLUMN offices_psb.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.status IS 'Status';


--
-- Name: COLUMN offices_psb.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.org_id IS 'Подразделение';


--
-- Name: COLUMN offices_psb.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.user_id IS 'Пользователь';


--
-- Name: COLUMN offices_psb.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN offices_psb.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN offices_psb.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN offices_psb.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN offices_psb.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.is_system IS 'System object';


--
-- Name: COLUMN offices_psb.parent_org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.parent_org_id IS 'Родительское подразделение';


--
-- Name: COLUMN offices_psb.short_name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.short_name__ru IS 'Краткое наименование, languageSchema=ru';


--
-- Name: COLUMN offices_psb.short_name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.short_name__en IS 'Краткое наименование, languageSchema=en';


--
-- Name: COLUMN offices_psb.short_name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.short_name IS 'Краткое наименование';


--
-- Name: COLUMN offices_psb.view_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.view_id IS 'Вид подразделения';


--
-- Name: COLUMN offices_psb.main_org; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.main_org IS 'Обособленное подразделение';


--
-- Name: COLUMN offices_psb.org_company; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.org_company IS 'Контрагент подразделения';


--
-- Name: COLUMN offices_psb.ident; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.ident IS 'Сист. Идентификатор';


--
-- Name: COLUMN offices_psb.office_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.office_id IS 'ID офиса';


--
-- Name: COLUMN offices_psb.office_name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.office_name IS 'Наименование офиса';


--
-- Name: COLUMN offices_psb.office_address; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.office_address IS 'Адрес офис';


--
-- Name: COLUMN offices_psb.office_code; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.office_code IS 'Код региона офиса';


--
-- Name: COLUMN offices_psb.office_date_from; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.office_date_from IS 'Дата открытия офиса';


--
-- Name: COLUMN offices_psb.office_date_to; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.office_date_to IS 'Дата закрытия офиса';


--
-- Name: COLUMN offices_psb.office_type; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.office_type IS 'Тип офиса';


--
-- Name: COLUMN offices_psb.office_status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.office_status IS 'Профиль обслуживания офиса';


--
-- Name: COLUMN offices_psb.office_sign_active; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.office_sign_active IS 'Признак действия офиса';


--
-- Name: COLUMN offices_psb.psb_dep_org; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.psb_dep_org IS 'Организация';


--
-- Name: COLUMN offices_psb.rout_office_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.rout_office_id IS 'Офис для маршрутизации';


--
-- Name: COLUMN offices_psb.lvl_org; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.lvl_org IS 'Уровень подразделения';


--
-- Name: COLUMN offices_psb.feat_org; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.feat_org IS 'Признак: 1 - ГО';


--
-- Name: COLUMN offices_psb.is_region; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.is_region IS 'Признак МО';


--
-- Name: COLUMN offices_psb.work_org; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.work_org IS 'Признак: 1 - работает; 0 - закрыто';


--
-- Name: COLUMN offices_psb.etl_marker_org; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.etl_marker_org IS 'Маркер загрузки из внешней системы';


--
-- Name: COLUMN offices_psb.id_parent_org; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.id_parent_org IS 'Внешний ИД родителя';


--
-- Name: COLUMN offices_psb.id_depart_org; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.id_depart_org IS 'Внешний ИД Департамента';


--
-- Name: COLUMN offices_psb.id_parent_corr_org; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.offices_psb.id_parent_corr_org IS 'ID ДО или филиала, которому подчинено ДО';


--
-- Name: participant_app; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.participant_app (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    app_obj_id bigint,
    borrower_id bigint,
    is_current smallint,
    is_check_need smallint,
    part_type_id bigint,
    is_permanent_role smallint,
    sec_date_check timestamp(6) without time zone,
    sec_appeal_date timestamp(6) without time zone,
    is_sec_appeal smallint,
    is_antifrod_success smallint,
    is_perm_role_for_head smallint,
    emp_appeal_id bigint,
    is_create_check smallint,
    is_add_manual smallint,
    check_role_part_str character varying(2000),
    is_borrower smallint,
    is_related_entity smallint,
    is_affiliate smallint,
    is_pledger smallint,
    is_guarantor smallint,
    return_code_txt text,
    id_siam_str character varying(2000),
    consentbkidate timestamp(6) without time zone,
    is_bch_form_error smallint,
    is_seller smallint,
    scp_link_particip_id bigint,
    particip_sec_id bigint,
    is_guar_prov_balhold smallint,
    is_state_affilation smallint,
    sec_check_auto_date timestamp(6) without time zone,
    bch_refuse smallint,
    bch_record_link character varying(2000),
    app_obj_person_conn_id bigint,
    name__en character varying(2000),
    obj_owner_id bigint,
    is_director smallint,
    is_actual_owner smallint,
    is_founder smallint,
    is_legal_person smallint,
    bki_status character varying(2000)
);



--
-- Name: TABLE participant_app; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.participant_app IS 'Участники сделки, SysObjTypeEffective{id=2501233, ident=''PARTICIPANT_APP'', name=''Участники сделки'', 12 attributes (12 actualizing)}';


--
-- Name: COLUMN participant_app.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.id IS 'ID';


--
-- Name: COLUMN participant_app.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN participant_app.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.name IS 'Name';


--
-- Name: COLUMN participant_app.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.create_date IS 'Create date';


--
-- Name: COLUMN participant_app.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.type_id IS 'Тип объекта';


--
-- Name: COLUMN participant_app.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.status IS 'Status';


--
-- Name: COLUMN participant_app.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.org_id IS 'Подразделение';


--
-- Name: COLUMN participant_app.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.user_id IS 'Пользователь';


--
-- Name: COLUMN participant_app.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN participant_app.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN participant_app.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN participant_app.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN participant_app.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.is_system IS 'System object';


--
-- Name: COLUMN participant_app.app_obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.app_obj_id IS 'Ссылка на заявку';


--
-- Name: COLUMN participant_app.borrower_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.borrower_id IS 'Ссылка на лицо';


--
-- Name: COLUMN participant_app.is_current; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.is_current IS 'Действующий';


--
-- Name: COLUMN participant_app.is_check_need; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.is_check_need IS 'Необходимость проверки';


--
-- Name: COLUMN participant_app.part_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.part_type_id IS 'Тип участника сделки';


--
-- Name: COLUMN participant_app.is_permanent_role; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.is_permanent_role IS 'Неизменяемость роли для КМ (тех.)';


--
-- Name: COLUMN participant_app.sec_date_check; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.sec_date_check IS 'Дата проверки СЭБ (итоговая)';


--
-- Name: COLUMN participant_app.sec_appeal_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.sec_appeal_date IS 'Дата апелляции';


--
-- Name: COLUMN participant_app.is_sec_appeal; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.is_sec_appeal IS 'Апелляция';


--
-- Name: COLUMN participant_app.is_antifrod_success; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.is_antifrod_success IS 'Успешность проверки антифрод';


--
-- Name: COLUMN participant_app.is_perm_role_for_head; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.is_perm_role_for_head IS 'Неизменяемость роли для Рук-ля КМ (тех.)';


--
-- Name: COLUMN participant_app.emp_appeal_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.emp_appeal_id IS 'Ответственный за апелляцию';


--
-- Name: COLUMN participant_app.is_create_check; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.is_create_check IS 'Создать автопроверки (тех.)';


--
-- Name: COLUMN participant_app.is_add_manual; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.is_add_manual IS 'Добавлен вручную';


--
-- Name: COLUMN participant_app.check_role_part_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.check_role_part_str IS 'Проверяемые роли (строковый)';


--
-- Name: COLUMN participant_app.is_borrower; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.is_borrower IS 'Заемщик';


--
-- Name: COLUMN participant_app.is_related_entity; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.is_related_entity IS 'Лицо, связанное с заемщиком';


--
-- Name: COLUMN participant_app.is_affiliate; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.is_affiliate IS 'Аффилированное лицо';


--
-- Name: COLUMN participant_app.is_pledger; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.is_pledger IS 'Залогодатель';


--
-- Name: COLUMN participant_app.is_guarantor; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.is_guarantor IS 'Поручитель';


--
-- Name: COLUMN participant_app.return_code_txt; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.return_code_txt IS 'Текст ошибки';


--
-- Name: COLUMN participant_app.id_siam_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.id_siam_str IS 'Идентификатор отчета';


--
-- Name: COLUMN participant_app.consentbkidate; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.consentbkidate IS 'Дата согласия БКИ';


--
-- Name: COLUMN participant_app.is_bch_form_error; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.is_bch_form_error IS 'Ошибки при формировании БКИ (тех.)';


--
-- Name: COLUMN participant_app.is_seller; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.is_seller IS 'Продавец';


--
-- Name: COLUMN participant_app.scp_link_particip_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.scp_link_particip_id IS 'Ссылка на участника ГСЛ';


--
-- Name: COLUMN participant_app.particip_sec_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.particip_sec_id IS 'Ссылка на экспертизу СЭБ по участнику';


--
-- Name: COLUMN participant_app.is_guar_prov_balhold; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.is_guar_prov_balhold IS 'Является балансодержателем или держателем основной выручки';


--
-- Name: COLUMN participant_app.is_state_affilation; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.is_state_affilation IS 'Заёмщик является унитарным предприятием или государственная структура имеет контрольный пакет';


--
-- Name: COLUMN participant_app.sec_check_auto_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.sec_check_auto_date IS 'Дата завершения автопроверок';


--
-- Name: COLUMN participant_app.bch_refuse; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.bch_refuse IS 'Отказ от БКИ';


--
-- Name: COLUMN participant_app.bch_record_link; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.bch_record_link IS 'Ссылка на отчет БКИ';


--
-- Name: COLUMN participant_app.app_obj_person_conn_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.app_obj_person_conn_id IS 'Ссылка на заявку (для связанных ФЛ)';


--
-- Name: COLUMN participant_app.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN participant_app.obj_owner_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.obj_owner_id IS 'Ссылка на объект владелец';


--
-- Name: COLUMN participant_app.is_director; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.is_director IS 'ЕИО';


--
-- Name: COLUMN participant_app.is_actual_owner; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.is_actual_owner IS 'Фактический собственник';


--
-- Name: COLUMN participant_app.is_founder; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.is_founder IS 'Учредитель';


--
-- Name: COLUMN participant_app.is_legal_person; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.is_legal_person IS 'ЮЛ, которое представляет Заемщик ФЛ';


--
-- Name: COLUMN participant_app.bki_status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.participant_app.bki_status IS 'Состояние БКИ';


--
-- Name: prod_change_params; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.prod_change_params (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    product_pricing_id bigint,
    change_param_dict_id bigint,
    scp_new_cond character varying(2000),
    scp_old_cond_val character varying(2000),
    scp_old_cond character varying(2000),
    scp_new_cond_val character varying(2000),
    value_comment character varying(2000),
    link_card_obj_id bigint,
    com_val_proc numeric,
    payment_schedule_id bigint,
    pay_reward_cond_id bigint,
    sum_pay_type_id bigint,
    comm_date_pay_id bigint,
    bank_val_sum numeric,
    new_bank_val_sum numeric,
    new_pay_reward_cond_id bigint,
    new_com_val_proc numeric,
    scp_comiss_size_str character varying(2000),
    new_comiss_size_str character varying(2000),
    is_add_manual smallint,
    is_auto_creation smallint
);



--
-- Name: TABLE prod_change_params; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.prod_change_params IS 'СКП. Изменяемые параметры продукта, SysObjTypeEffective{id=3701691, ident=''PROD_CHANGE_PARAMS'', name=''СКП. Изменяемые параметры продукта'', 12 attributes (12 actualizing)}';


--
-- Name: COLUMN prod_change_params.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.id IS 'ID';


--
-- Name: COLUMN prod_change_params.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN prod_change_params.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN prod_change_params.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.name IS 'Name';


--
-- Name: COLUMN prod_change_params.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.create_date IS 'Create date';


--
-- Name: COLUMN prod_change_params.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.type_id IS 'Тип объекта';


--
-- Name: COLUMN prod_change_params.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.status IS 'Status';


--
-- Name: COLUMN prod_change_params.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.org_id IS 'Подразделение';


--
-- Name: COLUMN prod_change_params.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.user_id IS 'Пользователь';


--
-- Name: COLUMN prod_change_params.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN prod_change_params.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN prod_change_params.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN prod_change_params.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN prod_change_params.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.is_system IS 'System object';


--
-- Name: COLUMN prod_change_params.product_pricing_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.product_pricing_id IS 'Ценообразование по продукту';


--
-- Name: COLUMN prod_change_params.change_param_dict_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.change_param_dict_id IS 'Изменяемый параметр';


--
-- Name: COLUMN prod_change_params.scp_new_cond; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.scp_new_cond IS 'Предлагаемые условия, %';


--
-- Name: COLUMN prod_change_params.scp_old_cond_val; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.scp_old_cond_val IS 'Предлагаемые условия, руб.';


--
-- Name: COLUMN prod_change_params.scp_old_cond; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.scp_old_cond IS 'Текущие условия, %';


--
-- Name: COLUMN prod_change_params.scp_new_cond_val; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.scp_new_cond_val IS 'Текущие условия, руб.';


--
-- Name: COLUMN prod_change_params.value_comment; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.value_comment IS 'Комментарий к значению';


--
-- Name: COLUMN prod_change_params.link_card_obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.link_card_obj_id IS 'Ссылка на объект';


--
-- Name: COLUMN prod_change_params.com_val_proc; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.com_val_proc IS 'Размер  (%) текущий';


--
-- Name: COLUMN prod_change_params.payment_schedule_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.payment_schedule_id IS 'Порядок выплаты';


--
-- Name: COLUMN prod_change_params.pay_reward_cond_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.pay_reward_cond_id IS 'Условие уплаты вознаграждения за предоставление банковской гарантии (текущее)';


--
-- Name: COLUMN prod_change_params.sum_pay_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.sum_pay_type_id IS 'Вид суммы для уплаты комиссии';


--
-- Name: COLUMN prod_change_params.comm_date_pay_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.comm_date_pay_id IS 'Дата уплаты комиссии';


--
-- Name: COLUMN prod_change_params.bank_val_sum; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.bank_val_sum IS 'Размер (руб) текущий';


--
-- Name: COLUMN prod_change_params.new_bank_val_sum; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.new_bank_val_sum IS 'Размер (руб) предлагаемый';


--
-- Name: COLUMN prod_change_params.new_pay_reward_cond_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.new_pay_reward_cond_id IS 'Условие уплаты вознаграждения за предоставление банковской гарантии (новое)';


--
-- Name: COLUMN prod_change_params.new_com_val_proc; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.new_com_val_proc IS 'Размер (%) предлагаемый';


--
-- Name: COLUMN prod_change_params.scp_comiss_size_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.scp_comiss_size_str IS '_/годовых';


--
-- Name: COLUMN prod_change_params.new_comiss_size_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.new_comiss_size_str IS '_/годовых (предл)';


--
-- Name: COLUMN prod_change_params.is_add_manual; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.is_add_manual IS 'Добавлен вручную';


--
-- Name: COLUMN prod_change_params.is_auto_creation; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_change_params.is_auto_creation IS 'Создан автоматически';


--
-- Name: prod_commissions; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.prod_commissions (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    prod_comm_dict_id bigint,
    scp_comiss_size_str character varying(2000),
    scp_payment_shedule_str character varying(2000),
    com_val_proc numeric,
    value_comment character varying(2000),
    link_card_obj_id bigint,
    is_for_state_program smallint,
    comm_date_pay_id bigint,
    sum_pay_type_id bigint,
    payment_schedule_id bigint,
    is_from_pricing smallint,
    is_add_manual smallint,
    is_current_conds smallint,
    commission_out_of_dict smallint,
    bank_val_sum numeric
);



--
-- Name: TABLE prod_commissions; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.prod_commissions IS 'СКП. Комиссии продукта, SysObjTypeEffective{id=3701709, ident=''PROD_COMMISSIONS'', name=''СКП. Комиссии продукта'', 12 attributes (12 actualizing)}';


--
-- Name: COLUMN prod_commissions.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.id IS 'ID';


--
-- Name: COLUMN prod_commissions.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN prod_commissions.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN prod_commissions.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.name IS 'Name';


--
-- Name: COLUMN prod_commissions.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.create_date IS 'Create date';


--
-- Name: COLUMN prod_commissions.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.type_id IS 'Тип объекта';


--
-- Name: COLUMN prod_commissions.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.status IS 'Status';


--
-- Name: COLUMN prod_commissions.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.org_id IS 'Подразделение';


--
-- Name: COLUMN prod_commissions.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.user_id IS 'Пользователь';


--
-- Name: COLUMN prod_commissions.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN prod_commissions.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN prod_commissions.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN prod_commissions.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN prod_commissions.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.is_system IS 'System object';


--
-- Name: COLUMN prod_commissions.prod_comm_dict_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.prod_comm_dict_id IS 'Комиссия';


--
-- Name: COLUMN prod_commissions.scp_comiss_size_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.scp_comiss_size_str IS 'Размер комиссии (строка)';


--
-- Name: COLUMN prod_commissions.scp_payment_shedule_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.scp_payment_shedule_str IS 'Порядок выплаты';


--
-- Name: COLUMN prod_commissions.com_val_proc; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.com_val_proc IS 'Размер комиссии (%)';


--
-- Name: COLUMN prod_commissions.value_comment; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.value_comment IS 'Комментарий к значению';


--
-- Name: COLUMN prod_commissions.link_card_obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.link_card_obj_id IS 'Ссылка на объект';


--
-- Name: COLUMN prod_commissions.is_for_state_program; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.is_for_state_program IS 'Комиссия для госпрограммы';


--
-- Name: COLUMN prod_commissions.comm_date_pay_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.comm_date_pay_id IS 'Дата уплаты комиссии';


--
-- Name: COLUMN prod_commissions.sum_pay_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.sum_pay_type_id IS 'Вид суммы для уплаты комиссии';


--
-- Name: COLUMN prod_commissions.payment_schedule_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.payment_schedule_id IS 'Порядок выплаты';


--
-- Name: COLUMN prod_commissions.is_from_pricing; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.is_from_pricing IS 'Добавлен из ЦО';


--
-- Name: COLUMN prod_commissions.is_add_manual; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.is_add_manual IS 'Добавлена вручную';


--
-- Name: COLUMN prod_commissions.is_current_conds; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.is_current_conds IS 'Скопировано с предыдущего ЦО';


--
-- Name: COLUMN prod_commissions.commission_out_of_dict; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.commission_out_of_dict IS 'Комиссии нет в справочнике';


--
-- Name: COLUMN prod_commissions.bank_val_sum; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_commissions.bank_val_sum IS 'Размер (руб)';


--
-- Name: prod_guarantees; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.prod_guarantees (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    link_card_obj_id bigint,
    prod_guarant_dict_id bigint,
    bank_val_proc numeric,
    bank_val_sum numeric,
    guarantee_type_id bigint,
    is_from_pricing smallint,
    is_current_conds smallint
);



--
-- Name: TABLE prod_guarantees; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.prod_guarantees IS 'СКП. Гарантии продукта, SysObjTypeEffective{id=3791645, ident=''PROD_GUARANTEES'', name=''СКП. Гарантии продукта'', 12 attributes (12 actualizing)}';


--
-- Name: COLUMN prod_guarantees.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_guarantees.id IS 'ID';


--
-- Name: COLUMN prod_guarantees.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_guarantees.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN prod_guarantees.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_guarantees.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN prod_guarantees.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_guarantees.name IS 'Name';


--
-- Name: COLUMN prod_guarantees.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_guarantees.create_date IS 'Create date';


--
-- Name: COLUMN prod_guarantees.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_guarantees.type_id IS 'Тип объекта';


--
-- Name: COLUMN prod_guarantees.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_guarantees.status IS 'Status';


--
-- Name: COLUMN prod_guarantees.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_guarantees.org_id IS 'Подразделение';


--
-- Name: COLUMN prod_guarantees.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_guarantees.user_id IS 'Пользователь';


--
-- Name: COLUMN prod_guarantees.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_guarantees.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN prod_guarantees.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_guarantees.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN prod_guarantees.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_guarantees.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN prod_guarantees.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_guarantees.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN prod_guarantees.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_guarantees.is_system IS 'System object';


--
-- Name: COLUMN prod_guarantees.link_card_obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_guarantees.link_card_obj_id IS 'Ссылка на объект';


--
-- Name: COLUMN prod_guarantees.prod_guarant_dict_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_guarantees.prod_guarant_dict_id IS 'Гарантия';


--
-- Name: COLUMN prod_guarantees.bank_val_proc; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_guarantees.bank_val_proc IS 'Размер (% годовых)';


--
-- Name: COLUMN prod_guarantees.bank_val_sum; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_guarantees.bank_val_sum IS 'Размер (руб)';


--
-- Name: COLUMN prod_guarantees.guarantee_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_guarantees.guarantee_type_id IS 'Вид гарантии';


--
-- Name: COLUMN prod_guarantees.is_from_pricing; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_guarantees.is_from_pricing IS 'Добавлен из ЦО';


--
-- Name: COLUMN prod_guarantees.is_current_conds; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.prod_guarantees.is_current_conds IS 'Скопировано с предыдущего ЦО';


--
-- Name: product_pricing; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.product_pricing (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    pricing_card_id bigint,
    owner_object_id bigint,
    scp_is_individual smallint,
    scp_calc_rate_val numeric,
    scp_min_margin_val numeric,
    offer_margin_over numeric,
    rate_type_id bigint,
    scp_sublimit_srok numeric,
    scp_sublimit_sum numeric,
    draft_decision_id bigint,
    is_inactive smallint,
    product_pricing_id bigint,
    is_state_program smallint,
    tranche_term numeric,
    tranche_term_days numeric,
    g_rate_principal numeric,
    cr_amount numeric,
    tender_guarantees character varying(2000),
    execution_guarantee character varying(2000),
    scp_min_insec_margin numeric,
    term_days numeric,
    pay_reward_cond_id bigint,
    amdp_parent_product_id bigint,
    el_individual numeric,
    is_param_calc smallint,
    cr_limit_guar numeric,
    clc_grade_id bigint,
    pricing_compare_id bigint,
    scp_modif_lim_quest_id bigint,
    clc_zone_id bigint,
    scp_sublimit_sum_prev numeric,
    gsl_limit numeric,
    type_loan_id bigint,
    app_product_id bigint,
    product_compound_id bigint,
    scp_min_margin_from numeric,
    scp_min_margin numeric,
    min_insec_margin_from numeric,
    min_insec_margin_to numeric,
    scp_calc_rate_val_from numeric,
    scp_calc_rate_val_to numeric,
    is_marge_range smallint,
    scp_min_margin_val_from smallint,
    offer_margin_over_from numeric,
    offer_margin_over_to numeric,
    fix_spread_value numeric,
    change_initiator_id bigint,
    product_pricing_cast_id bigint,
    is_out_app smallint,
    sublimit_sum numeric,
    is_umb_surety smallint,
    cl_group_id bigint
);



--
-- Name: TABLE product_pricing; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.product_pricing IS 'СКП. Ценообразование по продукту, SysObjTypeEffective{id=3701583, ident=''PRODUCT_PRICING'', name=''СКП. Ценообразование по продукту'', 12 attributes (12 actualizing)}';


--
-- Name: COLUMN product_pricing.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.id IS 'ID';


--
-- Name: COLUMN product_pricing.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN product_pricing.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN product_pricing.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.name IS 'Name';


--
-- Name: COLUMN product_pricing.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.create_date IS 'Create date';


--
-- Name: COLUMN product_pricing.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.type_id IS 'Тип объекта';


--
-- Name: COLUMN product_pricing.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.status IS 'Status';


--
-- Name: COLUMN product_pricing.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.org_id IS 'Подразделение';


--
-- Name: COLUMN product_pricing.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.user_id IS 'Пользователь';


--
-- Name: COLUMN product_pricing.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN product_pricing.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN product_pricing.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN product_pricing.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN product_pricing.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.is_system IS 'System object';


--
-- Name: COLUMN product_pricing.pricing_card_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.pricing_card_id IS 'Карточка ценообразования (цо)';


--
-- Name: COLUMN product_pricing.owner_object_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.owner_object_id IS 'Объект ценообразования (ЦО)';


--
-- Name: COLUMN product_pricing.scp_is_individual; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.scp_is_individual IS 'Индивидуальные ценовые условия';


--
-- Name: COLUMN product_pricing.scp_calc_rate_val; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.scp_calc_rate_val IS 'Справочно: расчетная ставка';


--
-- Name: COLUMN product_pricing.scp_min_margin_val; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.scp_min_margin_val IS 'Минимальная маржа';


--
-- Name: COLUMN product_pricing.offer_margin_over; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.offer_margin_over IS 'Предлагаемая маржа';


--
-- Name: COLUMN product_pricing.rate_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.rate_type_id IS 'Тип ставки';


--
-- Name: COLUMN product_pricing.scp_sublimit_srok; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.scp_sublimit_srok IS 'Срок, мес.';


--
-- Name: COLUMN product_pricing.scp_sublimit_sum; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.scp_sublimit_sum IS 'Сумма';


--
-- Name: COLUMN product_pricing.draft_decision_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.draft_decision_id IS 'Ссылка Проект решения (цо)';


--
-- Name: COLUMN product_pricing.is_inactive; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.is_inactive IS 'Недействующий (цо)';


--
-- Name: COLUMN product_pricing.product_pricing_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.product_pricing_id IS 'Входит в продукт (цо)';


--
-- Name: COLUMN product_pricing.is_state_program; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.is_state_program IS 'Применение госпрограммы';


--
-- Name: COLUMN product_pricing.tranche_term; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.tranche_term IS 'Срок транша (мес.)';


--
-- Name: COLUMN product_pricing.tranche_term_days; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.tranche_term_days IS 'Срок транша (дни)';


--
-- Name: COLUMN product_pricing.g_rate_principal; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.g_rate_principal IS 'Процентная ставка, уплачиваемая Принципалом в случае уплаты Банком Бенефициару по банковской гарантии';


--
-- Name: COLUMN product_pricing.cr_amount; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.cr_amount IS 'Сумма банковской гарантии';


--
-- Name: COLUMN product_pricing.tender_guarantees; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.tender_guarantees IS 'Тендерные гарантии (цо)';


--
-- Name: COLUMN product_pricing.execution_guarantee; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.execution_guarantee IS '_Гарантии исполнения контракта, гарантийный период, возврат аванса (цо)';


--
-- Name: COLUMN product_pricing.scp_min_insec_margin; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.scp_min_insec_margin IS 'Минимальная маржа на период необеспеченности';


--
-- Name: COLUMN product_pricing.term_days; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.term_days IS 'Срок, дни';


--
-- Name: COLUMN product_pricing.pay_reward_cond_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.pay_reward_cond_id IS 'Условие уплаты вознаграждения за предоставление банковской гарантии';


--
-- Name: COLUMN product_pricing.amdp_parent_product_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.amdp_parent_product_id IS 'Ссылка на продукт РУМ (ЦО)';


--
-- Name: COLUMN product_pricing.el_individual; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.el_individual IS '_EL индивидуальный (цо)';


--
-- Name: COLUMN product_pricing.is_param_calc; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.is_param_calc IS 'Параметры рассчитаны';


--
-- Name: COLUMN product_pricing.cr_limit_guar; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.cr_limit_guar IS 'Сумма лимита ответственности Гаранта';


--
-- Name: COLUMN product_pricing.clc_grade_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.clc_grade_id IS 'Посчитанный из АСПР грейд';


--
-- Name: COLUMN product_pricing.pricing_compare_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.pricing_compare_id IS 'Ссылка на технический тип';


--
-- Name: COLUMN product_pricing.scp_modif_lim_quest_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.scp_modif_lim_quest_id IS 'Ссылка на вопрос по пересмотру лимита (цо)';


--
-- Name: COLUMN product_pricing.clc_zone_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.clc_zone_id IS 'Посчитанная из АСПР зона';


--
-- Name: COLUMN product_pricing.scp_sublimit_sum_prev; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.scp_sublimit_sum_prev IS '_Сумма (текущие условия) (цо)';


--
-- Name: COLUMN product_pricing.gsl_limit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.gsl_limit IS 'Сумма общего лимита';


--
-- Name: COLUMN product_pricing.type_loan_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.type_loan_id IS 'Форма предоставления продукта';


--
-- Name: COLUMN product_pricing.app_product_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.app_product_id IS 'Продукт';


--
-- Name: COLUMN product_pricing.product_compound_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.product_compound_id IS 'Состав продукта';


--
-- Name: COLUMN product_pricing.scp_min_margin_from; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.scp_min_margin_from IS '_Минимальная маржа ОТ';


--
-- Name: COLUMN product_pricing.scp_min_margin; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.scp_min_margin IS '_Минимальная маржа ДО';


--
-- Name: COLUMN product_pricing.min_insec_margin_from; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.min_insec_margin_from IS '_Минимальная маржа на период необеспеченности ОТ';


--
-- Name: COLUMN product_pricing.min_insec_margin_to; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.min_insec_margin_to IS '_Минимальная маржа на период необеспеченности ДО';


--
-- Name: COLUMN product_pricing.scp_calc_rate_val_from; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.scp_calc_rate_val_from IS '_Справочно: расчетная ставка ОТ';


--
-- Name: COLUMN product_pricing.scp_calc_rate_val_to; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.scp_calc_rate_val_to IS '_Справочно: расчетная ставка ДО';


--
-- Name: COLUMN product_pricing.is_marge_range; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.is_marge_range IS 'Применить диапазон по марже';


--
-- Name: COLUMN product_pricing.scp_min_margin_val_from; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.scp_min_margin_val_from IS '_Минимальная маржа ОТ';


--
-- Name: COLUMN product_pricing.offer_margin_over_from; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.offer_margin_over_from IS '_Предлагаемая маржа для овердрафта ОТ';


--
-- Name: COLUMN product_pricing.offer_margin_over_to; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.offer_margin_over_to IS '_Предлагаемая маржа для овердрафта ДО';


--
-- Name: COLUMN product_pricing.fix_spread_value; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.fix_spread_value IS 'Спред за фиксацию';


--
-- Name: COLUMN product_pricing.change_initiator_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.change_initiator_id IS 'Инициатор изменений';


--
-- Name: COLUMN product_pricing.product_pricing_cast_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.product_pricing_cast_id IS 'Ссылка на слепок ЦО';


--
-- Name: COLUMN product_pricing.is_out_app; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.is_out_app IS 'Заявки нет в Гриндате';


--
-- Name: COLUMN product_pricing.sublimit_sum; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.sublimit_sum IS 'Сумма сублимита';


--
-- Name: COLUMN product_pricing.is_umb_surety; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.is_umb_surety IS 'Зонтичное поручительство/Обеспечение 1,2 категории качества не менее 50%';


--
-- Name: COLUMN product_pricing.cl_group_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.product_pricing.cl_group_id IS 'Группа клиента';


--
-- Name: scp_amd_product; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.scp_amd_product (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    app_product_id bigint,
    loan_type_id bigint,
    scp_sublimit_val bigint,
    scp_general_amount numeric,
    amdp_parent_product_id bigint,
    product_term bigint,
    product_limitation bigint,
    product_compound_id bigint,
    type_gov_prog_id bigint,
    is_inactive smallint,
    blanc_deal_asmt_result bigint,
    is_blanc_credit smallint,
    monthly_contribution numeric,
    loan_type_afhd_id bigint,
    repayment_type_id bigint,
    rate_increase_blanc numeric,
    amount_blanc_deal numeric,
    amount_blanc_deal_clt numeric,
    allowed_blanc_amo_prod numeric,
    is_contract_logic_p smallint,
    draft_dec_id bigint,
    is_oth_bank_guar_psb smallint,
    contr_cont_id bigint,
    is_add_req_bank_guar smallint,
    security_part_id bigint,
    is_requirements_meets smallint,
    is_sdo smallint,
    comp_type_gov_prog_id bigint,
    clc_grade_id bigint,
    exp_limit_credit_rub numeric,
    el_individual numeric,
    clc_zone_id bigint,
    ident_viol_req character varying(2000),
    seq_subproduct_numb character varying(2000),
    scp_loan_sign bigint,
    borr_restr_seq_num bigint,
    curr_loan_debt bigint,
    amount_loan_debt numeric,
    product_risk_asses_id bigint,
    test_amd_proj_link bigint,
    scp_prod_quest_id bigint,
    amd_proj_link bigint,
    prod_term_date timestamp(6) without time zone,
    scp_loan_sign_id bigint,
    amd_prod_link_id bigint,
    cl_group_id bigint,
    question_structure text,
    is_over_limit smallint
);



--
-- Name: TABLE scp_amd_product; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.scp_amd_product IS 'СКП. РУМ. Продукт РУМ, SysObjTypeEffective{id=3715229, ident=''SCP_AMD_PRODUCT'', name=''СКП. РУМ. Продукт РУМ'', 12 attributes (12 actualizing)}';


--
-- Name: COLUMN scp_amd_product.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.id IS 'ID';


--
-- Name: COLUMN scp_amd_product.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN scp_amd_product.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN scp_amd_product.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.name IS 'Name';


--
-- Name: COLUMN scp_amd_product.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.create_date IS 'Create date';


--
-- Name: COLUMN scp_amd_product.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.type_id IS 'Тип объекта';


--
-- Name: COLUMN scp_amd_product.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.status IS 'Status';


--
-- Name: COLUMN scp_amd_product.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.org_id IS 'Подразделение';


--
-- Name: COLUMN scp_amd_product.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.user_id IS 'Пользователь';


--
-- Name: COLUMN scp_amd_product.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN scp_amd_product.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN scp_amd_product.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN scp_amd_product.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN scp_amd_product.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.is_system IS 'System object';


--
-- Name: COLUMN scp_amd_product.app_product_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.app_product_id IS 'Продукт';


--
-- Name: COLUMN scp_amd_product.loan_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.loan_type_id IS 'Форма предоставления';


--
-- Name: COLUMN scp_amd_product.scp_sublimit_val; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.scp_sublimit_val IS 'Валюта';


--
-- Name: COLUMN scp_amd_product.scp_general_amount; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.scp_general_amount IS 'Сумма';


--
-- Name: COLUMN scp_amd_product.amdp_parent_product_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.amdp_parent_product_id IS 'Ссылка на материнский продукт';


--
-- Name: COLUMN scp_amd_product.product_term; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.product_term IS 'Срок продукта (месяцев)';


--
-- Name: COLUMN scp_amd_product.product_limitation; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.product_limitation IS 'Срок продукта не более (дней)';


--
-- Name: COLUMN scp_amd_product.product_compound_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.product_compound_id IS 'Состав продукта';


--
-- Name: COLUMN scp_amd_product.type_gov_prog_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.type_gov_prog_id IS 'Программа господдержки';


--
-- Name: COLUMN scp_amd_product.is_inactive; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.is_inactive IS 'Недействующий';


--
-- Name: COLUMN scp_amd_product.blanc_deal_asmt_result; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.blanc_deal_asmt_result IS 'Результат оценки допустимой бланко-части по сделке';


--
-- Name: COLUMN scp_amd_product.is_blanc_credit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.is_blanc_credit IS 'Бланковое кредитование';


--
-- Name: COLUMN scp_amd_product.monthly_contribution; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.monthly_contribution IS 'Ежемесячный взнос, руб.';


--
-- Name: COLUMN scp_amd_product.loan_type_afhd_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.loan_type_afhd_id IS 'Форма предоставления (для АФХД)';


--
-- Name: COLUMN scp_amd_product.repayment_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.repayment_type_id IS 'Форма погашения';


--
-- Name: COLUMN scp_amd_product.rate_increase_blanc; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.rate_increase_blanc IS 'Увеличение ставки для бланкового кредитования';


--
-- Name: COLUMN scp_amd_product.amount_blanc_deal; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.amount_blanc_deal IS 'Сумма бланкочасти рассчитанная по сделке исходя из указанного обеспечения';


--
-- Name: COLUMN scp_amd_product.amount_blanc_deal_clt; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.amount_blanc_deal_clt IS 'Сумма БЧ по сделке, исходя из указанного обеспечения';


--
-- Name: COLUMN scp_amd_product.allowed_blanc_amo_prod; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.allowed_blanc_amo_prod IS 'Допустимая сумма БЧ на продукт';


--
-- Name: COLUMN scp_amd_product.is_contract_logic_p; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.is_contract_logic_p IS 'Контрактная логика';


--
-- Name: COLUMN scp_amd_product.draft_dec_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.draft_dec_id IS '_Ссылка на вопрос (принятие решения)';


--
-- Name: COLUMN scp_amd_product.is_oth_bank_guar_psb; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.is_oth_bank_guar_psb IS 'Существуют ли другие БГ в ПСБ?';


--
-- Name: COLUMN scp_amd_product.contr_cont_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.contr_cont_id IS 'Ссылка на контейнер контрактов';


--
-- Name: COLUMN scp_amd_product.is_add_req_bank_guar; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.is_add_req_bank_guar IS 'В контракте есть требования по другим БГ? / Есть ли БГ исполнения обязательств/возврата аванса?';


--
-- Name: COLUMN scp_amd_product.security_part_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.security_part_id IS 'Ссылка на обеспечительную часть продукта';


--
-- Name: COLUMN scp_amd_product.is_requirements_meets; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.is_requirements_meets IS 'Соответствие требованиям';


--
-- Name: COLUMN scp_amd_product.is_sdo; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.is_sdo IS 'Относится к ГОЗ';


--
-- Name: COLUMN scp_amd_product.comp_type_gov_prog_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.comp_type_gov_prog_id IS 'Программа господдержки (для сравнения)';


--
-- Name: COLUMN scp_amd_product.clc_grade_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.clc_grade_id IS 'Посчитанный из АСПР грейд';


--
-- Name: COLUMN scp_amd_product.exp_limit_credit_rub; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.exp_limit_credit_rub IS 'Расчетный лимит кредитования (руб.)';


--
-- Name: COLUMN scp_amd_product.el_individual; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.el_individual IS 'EL индивидуальный';


--
-- Name: COLUMN scp_amd_product.clc_zone_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.clc_zone_id IS 'Посчитанная из АСПР зона';


--
-- Name: COLUMN scp_amd_product.ident_viol_req; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.ident_viol_req IS 'Выявленные нарушения требований';


--
-- Name: COLUMN scp_amd_product.seq_subproduct_numb; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.seq_subproduct_numb IS 'Порядковый номер продукта в госзаказе';


--
-- Name: COLUMN scp_amd_product.scp_loan_sign; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.scp_loan_sign IS 'Признак ссуды';


--
-- Name: COLUMN scp_amd_product.borr_restr_seq_num; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.borr_restr_seq_num IS 'Порядковый номер реструктуризации Заемщика';


--
-- Name: COLUMN scp_amd_product.curr_loan_debt; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.curr_loan_debt IS 'Валюта ОСЗ';


--
-- Name: COLUMN scp_amd_product.amount_loan_debt; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.amount_loan_debt IS 'Остаток ссудной задолженности';


--
-- Name: COLUMN scp_amd_product.product_risk_asses_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.product_risk_asses_id IS 'Оценка риска по продукту';


--
-- Name: COLUMN scp_amd_product.test_amd_proj_link; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.test_amd_proj_link IS 'УДАЛИТЬ_Ссылка на проект решения';


--
-- Name: COLUMN scp_amd_product.scp_prod_quest_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.scp_prod_quest_id IS 'Ссылка на вопрос (структура вопросов)';


--
-- Name: COLUMN scp_amd_product.amd_proj_link; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.amd_proj_link IS 'Ссылка на проект решения (ЛС логика)';


--
-- Name: COLUMN scp_amd_product.prod_term_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.prod_term_date IS 'Срок продукта (дата)';


--
-- Name: COLUMN scp_amd_product.scp_loan_sign_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.scp_loan_sign_id IS 'Признак ссуды для внесения в ИСУБД Новая Афина';


--
-- Name: COLUMN scp_amd_product.amd_prod_link_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.amd_prod_link_id IS 'Ссылка на продукт РУМ (тех.)';


--
-- Name: COLUMN scp_amd_product.cl_group_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.cl_group_id IS 'Группа клиента';


--
-- Name: COLUMN scp_amd_product.question_structure; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.question_structure IS 'Комментарий';


--
-- Name: COLUMN scp_amd_product.is_over_limit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_amd_product.is_over_limit IS 'Вне лимита';


--
-- Name: scp_application; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.scp_application (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    afl_doc_num character varying(2000),
    afl_doc_data timestamp without time zone,
    afp_state_id bigint,
    initiator_id bigint,
    req_type_id bigint,
    lim_sum numeric,
    loan_terms bigint,
    lim_currency_id bigint,
    gsl_limit numeric,
    credit_logic_id bigint,
    lending_tech_id bigint,
    emp_id bigint,
    processing_steps_id bigint,
    scp_curr_emp character varying(2000),
    temp_cont_turn bigint,
    risk_zone_id bigint,
    calc_risk_date timestamp(6) without time zone,
    is_active_exp_sec smallint,
    cr_id bigint,
    scp_appl_type_id bigint,
    deleg_region_id bigint,
    scp_hcm_decision_id bigint,
    is_active_get_gsl_part smallint,
    scp_tech_ctredit bigint,
    scp_business_segment bigint,
    is_start_bp_fa smallint,
    is_tech_ham_task_comp smallint,
    is_collat_exp_launched smallint,
    is_simplified_fa smallint,
    is_start_bp_request_fa smallint,
    auto_check_status bigint,
    client_type_id bigint,
    gsl_title character varying(2000),
    other_parts character varying(2000),
    is_without_pledge smallint,
    is_main_owner smallint,
    third_parties text,
    decis_level_id bigint,
    ca_decis_level_id bigint,
    is_legal_exp_launched smallint,
    voting_fm_id bigint,
    voting_km_id bigint,
    is_legal_exp_restart smallint,
    scp_gsl_name_str character varying(2000),
    pricing_id bigint,
    price_calc_completed smallint,
    resp_cond_coord bigint,
    curator_head_id bigint,
    is_lspr_level smallint,
    collateral_cont_id bigint,
    clc_grade_id bigint,
    scp_arm_manager_id bigint,
    scp_proc_steds_id bigint,
    is_auto_sec_errors smallint,
    is_auto_check_errors smallint,
    is_na_active smallint,
    reason_refusal_id bigint,
    is_form_bch_active smallint,
    is_bch_validator_on smallint,
    suz_start_page_str character varying(2000),
    is_active_get_arbitr smallint,
    scp_cheif_cm_id bigint,
    scp_rejection_comment text,
    scp_rejection_client_id bigint,
    ca_rout_office_id bigint,
    is_test smallint,
    client_list_changed smallint,
    tranche_term numeric,
    is_app_to_cred_depart smallint,
    scp_type_restruct_id bigint,
    is_need_agr_cd_co smallint,
    is_ca_notif smallint,
    scp_bg_owner_lidm bigint,
    is_check_list_cont_dev smallint,
    is_active_get_dp smallint,
    scp_bg_current_gr_limit numeric,
    scp_bg_total_prod_limit numeric,
    is_min_level_changed smallint,
    interm_file_storage bigint,
    is_proj_verif_finished smallint,
    gsl_data_cont_id bigint,
    industry_code_id bigint,
    is_cov_bank_garant smallint,
    scp_product_str character varying(2000),
    is_state_program smallint,
    cred_technology_str character varying(2000),
    is_not_red_zona_bool smallint,
    is_not_red_zone bigint,
    is_fin_activ_newsub smallint,
    prelim_gsl_calc_id bigint
);



--
-- Name: TABLE scp_application; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.scp_application IS 'СКП. Заявка, SysObjTypeEffective{id=2500962, ident=''SCP_APPLICATION'', name=''СКП. Заявка'', 18 attributes (18 actualizing)}';


--
-- Name: COLUMN scp_application.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.id IS 'ID';


--
-- Name: COLUMN scp_application.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN scp_application.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN scp_application.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.name IS 'Name';


--
-- Name: COLUMN scp_application.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.create_date IS 'Create date';


--
-- Name: COLUMN scp_application.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.type_id IS 'Тип объекта';


--
-- Name: COLUMN scp_application.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.status IS 'Status';


--
-- Name: COLUMN scp_application.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.org_id IS 'Подразделение';


--
-- Name: COLUMN scp_application.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.user_id IS 'Пользователь';


--
-- Name: COLUMN scp_application.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN scp_application.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN scp_application.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN scp_application.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN scp_application.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_system IS 'System object';


--
-- Name: COLUMN scp_application.afl_doc_num; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.afl_doc_num IS 'Номер документа';


--
-- Name: COLUMN scp_application.afl_doc_data; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.afl_doc_data IS 'Дата документа';


--
-- Name: COLUMN scp_application.afp_state_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.afp_state_id IS 'Состояние';


--
-- Name: COLUMN scp_application.initiator_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.initiator_id IS 'Клиент';


--
-- Name: COLUMN scp_application.req_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.req_type_id IS 'Класс заявки';


--
-- Name: COLUMN scp_application.lim_sum; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.lim_sum IS 'Сумма заявки';


--
-- Name: COLUMN scp_application.loan_terms; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.loan_terms IS 'Срок лимита';


--
-- Name: COLUMN scp_application.lim_currency_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.lim_currency_id IS 'Валюта';


--
-- Name: COLUMN scp_application.gsl_limit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.gsl_limit IS 'Сумма общего лимита';


--
-- Name: COLUMN scp_application.credit_logic_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.credit_logic_id IS 'Логика кредитования';


--
-- Name: COLUMN scp_application.lending_tech_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.lending_tech_id IS '_Технология кредитования';


--
-- Name: COLUMN scp_application.emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.emp_id IS 'Ответственный менеджер';


--
-- Name: COLUMN scp_application.processing_steps_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.processing_steps_id IS 'Текущий этап обработки';


--
-- Name: COLUMN scp_application.scp_curr_emp; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.scp_curr_emp IS 'Текущие исполнители';


--
-- Name: COLUMN scp_application.temp_cont_turn; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.temp_cont_turn IS 'Промежуточный контейнер загрузки ОСВ';


--
-- Name: COLUMN scp_application.risk_zone_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.risk_zone_id IS 'Результат проверки благонадежности и деловой репутации по заявке';


--
-- Name: COLUMN scp_application.calc_risk_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.calc_risk_date IS 'Дата предварительной зоны риска';


--
-- Name: COLUMN scp_application.is_active_exp_sec; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_active_exp_sec IS 'Заблокировано изменение участников (тех.)';


--
-- Name: COLUMN scp_application.cr_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.cr_id IS 'Ссылка на КЗ';


--
-- Name: COLUMN scp_application.scp_appl_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.scp_appl_type_id IS 'Тип заявки';


--
-- Name: COLUMN scp_application.deleg_region_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.deleg_region_id IS 'Регион клиента';


--
-- Name: COLUMN scp_application.scp_hcm_decision_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.scp_hcm_decision_id IS 'Вариант решения на задаче руководителя КМ';


--
-- Name: COLUMN scp_application.is_active_get_gsl_part; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_active_get_gsl_part IS 'Запущена сборка ГСЛ (тех)';


--
-- Name: COLUMN scp_application.scp_tech_ctredit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.scp_tech_ctredit IS 'Технология кредитования';


--
-- Name: COLUMN scp_application.scp_business_segment; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.scp_business_segment IS 'Клиентский сегмент';


--
-- Name: COLUMN scp_application.is_start_bp_fa; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_start_bp_fa IS 'Запуск БП из ФА (тех.)';


--
-- Name: COLUMN scp_application.is_tech_ham_task_comp; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_tech_ham_task_comp IS 'Задача рук. КМ завершена (тех.)';


--
-- Name: COLUMN scp_application.is_collat_exp_launched; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_collat_exp_launched IS 'Запущена залоговая экспертиза (тех.)';


--
-- Name: COLUMN scp_application.is_simplified_fa; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_simplified_fa IS 'Упрощенный Финансовый анализ';


--
-- Name: COLUMN scp_application.is_start_bp_request_fa; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_start_bp_request_fa IS 'Запуск БП из доп. запроса ФА(тех.)';


--
-- Name: COLUMN scp_application.auto_check_status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.auto_check_status IS 'Статус автопроверок';


--
-- Name: COLUMN scp_application.client_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.client_type_id IS 'Тип клиента';


--
-- Name: COLUMN scp_application.gsl_title; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.gsl_title IS '_Наименование ГСЛ';


--
-- Name: COLUMN scp_application.other_parts; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.other_parts IS 'Третьи лица';


--
-- Name: COLUMN scp_application.is_without_pledge; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_without_pledge IS 'Без залога';


--
-- Name: COLUMN scp_application.is_main_owner; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_main_owner IS 'Основные собственники';


--
-- Name: COLUMN scp_application.third_parties; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.third_parties IS 'Третьи лица';


--
-- Name: COLUMN scp_application.decis_level_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.decis_level_id IS 'Минимальный уровень принятия решения';


--
-- Name: COLUMN scp_application.ca_decis_level_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.ca_decis_level_id IS 'Уровень принятия решения - КА';


--
-- Name: COLUMN scp_application.is_legal_exp_launched; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_legal_exp_launched IS 'Запущена экспертиза правоспособности (тех.)';


--
-- Name: COLUMN scp_application.voting_fm_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.voting_fm_id IS 'Голосующий ФМ';


--
-- Name: COLUMN scp_application.voting_km_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.voting_km_id IS 'Голосующий КМ';


--
-- Name: COLUMN scp_application.is_legal_exp_restart; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_legal_exp_restart IS 'Перезапуск экспертизы правоспособности (тех.)';


--
-- Name: COLUMN scp_application.scp_gsl_name_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.scp_gsl_name_str IS 'Наименование ГСЛ';


--
-- Name: COLUMN scp_application.pricing_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.pricing_id IS 'Ценообразование';


--
-- Name: COLUMN scp_application.price_calc_completed; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.price_calc_completed IS 'Расчет ценовых параметров завершен';


--
-- Name: COLUMN scp_application.resp_cond_coord; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.resp_cond_coord IS 'Голосующий (индивидуальные условия)';


--
-- Name: COLUMN scp_application.curator_head_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.curator_head_id IS 'Куратор ГО';


--
-- Name: COLUMN scp_application.is_lspr_level; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_lspr_level IS 'Принятие решения в рамках ЛСПР Руководителей ПС';


--
-- Name: COLUMN scp_application.collateral_cont_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.collateral_cont_id IS 'Контейнер с обеспечением';


--
-- Name: COLUMN scp_application.clc_grade_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.clc_grade_id IS 'Посчитанный из АСПР грейд';


--
-- Name: COLUMN scp_application.scp_arm_manager_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.scp_arm_manager_id IS 'Сотрудник АРМ';


--
-- Name: COLUMN scp_application.scp_proc_steds_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.scp_proc_steds_id IS 'Этап обработки';


--
-- Name: COLUMN scp_application.is_auto_sec_errors; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_auto_sec_errors IS 'Наличие ошибок (автосэб)';


--
-- Name: COLUMN scp_application.is_auto_check_errors; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_auto_check_errors IS 'Наличие ошибок (предпроверки)';


--
-- Name: COLUMN scp_application.is_na_active; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_na_active IS 'Интеграция с НА по получению кредитных обязательств активна';


--
-- Name: COLUMN scp_application.reason_refusal_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.reason_refusal_id IS 'Причина отказа Банка';


--
-- Name: COLUMN scp_application.is_form_bch_active; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_form_bch_active IS 'Запущен сбор БКИ (тех.)';


--
-- Name: COLUMN scp_application.is_bch_validator_on; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_bch_validator_on IS 'Запущен валидатор БКИ (тех)';


--
-- Name: COLUMN scp_application.suz_start_page_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.suz_start_page_str IS 'Ссылка на стартовую страницу СУЗ';


--
-- Name: COLUMN scp_application.is_active_get_arbitr; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_active_get_arbitr IS 'Запущена сборка арбитражей (тех.)';


--
-- Name: COLUMN scp_application.scp_cheif_cm_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.scp_cheif_cm_id IS 'Руководитель КМ';


--
-- Name: COLUMN scp_application.scp_rejection_comment; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.scp_rejection_comment IS 'Комментарий по отказу';


--
-- Name: COLUMN scp_application.scp_rejection_client_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.scp_rejection_client_id IS 'Причина отказа Клиента';


--
-- Name: COLUMN scp_application.ca_rout_office_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.ca_rout_office_id IS 'Офис маршрутизации для КА';


--
-- Name: COLUMN scp_application.is_test; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_test IS 'Тестовая';


--
-- Name: COLUMN scp_application.client_list_changed; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.client_list_changed IS 'Состав клиентов был изменен';


--
-- Name: COLUMN scp_application.tranche_term; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.tranche_term IS 'Срок транша (мес.)';


--
-- Name: COLUMN scp_application.is_app_to_cred_depart; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_app_to_cred_depart IS 'Заявка передана в КП (тех.)';


--
-- Name: COLUMN scp_application.scp_type_restruct_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.scp_type_restruct_id IS 'Тип реструктуризации';


--
-- Name: COLUMN scp_application.is_need_agr_cd_co; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_need_agr_cd_co IS 'Требуется согласование ДК ГО';


--
-- Name: COLUMN scp_application.is_ca_notif; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_ca_notif IS 'КА уведомлен';


--
-- Name: COLUMN scp_application.scp_bg_owner_lidm; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.scp_bg_owner_lidm IS 'Владелец ЛСПР';


--
-- Name: COLUMN scp_application.is_check_list_cont_dev; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_check_list_cont_dev IS '_Чек-лист содержит отклонения';


--
-- Name: COLUMN scp_application.is_active_get_dp; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_active_get_dp IS 'Запущено обновление из ЦП';


--
-- Name: COLUMN scp_application.scp_bg_current_gr_limit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.scp_bg_current_gr_limit IS '_Текущий лимит кредитования по ГСЛ';


--
-- Name: COLUMN scp_application.scp_bg_total_prod_limit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.scp_bg_total_prod_limit IS '_Общий лимит по продукту';


--
-- Name: COLUMN scp_application.is_min_level_changed; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_min_level_changed IS 'Изменение мин. уровня Заявки СКП (тех.)';


--
-- Name: COLUMN scp_application.interm_file_storage; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.interm_file_storage IS 'Промежуточное хранение файла для загрузки анкет';


--
-- Name: COLUMN scp_application.is_proj_verif_finished; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_proj_verif_finished IS 'Сверка проектов решения завершена';


--
-- Name: COLUMN scp_application.gsl_data_cont_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.gsl_data_cont_id IS 'Ссылка на контейнер данных ГСЛ';


--
-- Name: COLUMN scp_application.industry_code_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.industry_code_id IS 'Отрасль клиента';


--
-- Name: COLUMN scp_application.is_cov_bank_garant; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_cov_bank_garant IS 'Покрытая Банковская гарантия';


--
-- Name: COLUMN scp_application.scp_product_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.scp_product_str IS 'Продукт (строка)';


--
-- Name: COLUMN scp_application.is_state_program; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_state_program IS 'Применение госпрограммы';


--
-- Name: COLUMN scp_application.cred_technology_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.cred_technology_str IS 'Технология кредитования (строка)';


--
-- Name: COLUMN scp_application.is_not_red_zona_bool; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_not_red_zona_bool IS 'Тех. Клиент отсутствует в «красной зоне» согласно данным EWS';


--
-- Name: COLUMN scp_application.is_not_red_zone; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_not_red_zone IS 'Клиент отсутствует в «Красной зоне» согласно данным EWS';


--
-- Name: COLUMN scp_application.is_fin_activ_newsub; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.is_fin_activ_newsub IS 'Финансирование деятельности в НС';


--
-- Name: COLUMN scp_application.prelim_gsl_calc_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_application.prelim_gsl_calc_id IS 'Ссылка на предварительный расчет';


--
-- Name: scp_collateral_app; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.scp_collateral_app (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    app_obj_id bigint,
    exp_obj_id bigint,
    out_collateral_id bigint,
    collateral_link character varying(2000),
    coll_appl_type_id bigint,
    na_pledge_type_id bigint,
    pledge_addr_str character varying(2000),
    security_quality_id bigint,
    quality_group_id bigint,
    liquidity_level_id bigint,
    attr_market_val numeric,
    attr_fair_val numeric,
    attr_collateral_val numeric,
    collat_obj_name character varying(2000),
    emp_id bigint,
    ca_exp_emp_id bigint,
    cur_upd_appl_id bigint,
    parent_collat_app_id bigint,
    collateral_discount numeric,
    discount_rate numeric,
    appl_state_id bigint,
    is_pres_spouse_cons smallint,
    is_pres_guar_pled smallint,
    necessity_insurance smallint,
    subs_pledge_id character varying(2000),
    total_struct_share numeric,
    is_current_concl smallint,
    conclus_txt text,
    pledge_concl_state_id bigint,
    is_export_suz smallint,
    pledge_conclus_date timestamp(6) without time zone,
    concl_validity_date timestamp(6) without time zone,
    perform_hr_face_id bigint,
    pledge_subject_id bigint,
    collat_common_obj_id bigint,
    collat_subj_count bigint,
    scp_arm_chief_id bigint,
    cp_arm_manager_id bigint,
    scp_info_comment_txt text,
    scp_info_proj_fin smallint,
    scp_info_adress_str character varying(2000),
    scp_info_sec_cost numeric,
    scp_info_type_na_id bigint,
    scp_info_cred_summ numeric,
    scp_info_type_prod_id bigint,
    scp_info_pledger_id bigint,
    scp_project_fin_id bigint,
    scp_fin_proj_id bigint,
    scp_quest_dec_id bigint,
    add_comm_concl_txt text,
    coll_link_str character varying(2000),
    scp_file_req_timest timestamp(6) without time zone,
    scp_info_vnd_id bigint,
    quest_decis_id bigint,
    testnumber numeric
);



--
-- Name: TABLE scp_collateral_app; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.scp_collateral_app IS 'СКП. Залоговая заявка, SysObjTypeEffective{id=3297928, ident=''SCP_COLLATERAL_APP'', name=''СКП. Залоговая заявка'', 12 attributes (12 actualizing)}';


--
-- Name: COLUMN scp_collateral_app.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.id IS 'ID';


--
-- Name: COLUMN scp_collateral_app.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN scp_collateral_app.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN scp_collateral_app.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.name IS 'Name';


--
-- Name: COLUMN scp_collateral_app.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.create_date IS 'Create date';


--
-- Name: COLUMN scp_collateral_app.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.type_id IS 'Тип объекта';


--
-- Name: COLUMN scp_collateral_app.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.status IS 'Status';


--
-- Name: COLUMN scp_collateral_app.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.org_id IS 'Подразделение';


--
-- Name: COLUMN scp_collateral_app.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.user_id IS 'Пользователь';


--
-- Name: COLUMN scp_collateral_app.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN scp_collateral_app.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN scp_collateral_app.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN scp_collateral_app.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN scp_collateral_app.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.is_system IS 'System object';


--
-- Name: COLUMN scp_collateral_app.app_obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.app_obj_id IS 'Ссылка на заявку';


--
-- Name: COLUMN scp_collateral_app.exp_obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.exp_obj_id IS 'Ссылка на экспертизу';


--
-- Name: COLUMN scp_collateral_app.out_collateral_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.out_collateral_id IS 'ID заявки в СУЗ';


--
-- Name: COLUMN scp_collateral_app.collateral_link; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.collateral_link IS 'Ссылка на СУЗ';


--
-- Name: COLUMN scp_collateral_app.coll_appl_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.coll_appl_type_id IS 'Тип заявки';


--
-- Name: COLUMN scp_collateral_app.na_pledge_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.na_pledge_type_id IS 'Тип залога (Новая Афина)';


--
-- Name: COLUMN scp_collateral_app.pledge_addr_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.pledge_addr_str IS 'Адрес объекта залога';


--
-- Name: COLUMN scp_collateral_app.security_quality_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.security_quality_id IS 'Категория качества обеспечения';


--
-- Name: COLUMN scp_collateral_app.quality_group_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.quality_group_id IS 'Группа качества';


--
-- Name: COLUMN scp_collateral_app.liquidity_level_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.liquidity_level_id IS 'Уровень ликвидности';


--
-- Name: COLUMN scp_collateral_app.attr_market_val; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.attr_market_val IS 'Рыночная стоимость';


--
-- Name: COLUMN scp_collateral_app.attr_fair_val; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.attr_fair_val IS 'Справедливая стоимость';


--
-- Name: COLUMN scp_collateral_app.attr_collateral_val; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.attr_collateral_val IS 'Залоговая стоимость';


--
-- Name: COLUMN scp_collateral_app.collat_obj_name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.collat_obj_name IS 'Наименование объекта';


--
-- Name: COLUMN scp_collateral_app.emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.emp_id IS 'Ответственный менеджер';


--
-- Name: COLUMN scp_collateral_app.ca_exp_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.ca_exp_emp_id IS 'Ответственный за проведение экспертизы КА';


--
-- Name: COLUMN scp_collateral_app.cur_upd_appl_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.cur_upd_appl_id IS 'Ссылка на текущую актуализацию';


--
-- Name: COLUMN scp_collateral_app.parent_collat_app_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.parent_collat_app_id IS 'Ссылка на заявку-родителя (для актуализации)';


--
-- Name: COLUMN scp_collateral_app.collateral_discount; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.collateral_discount IS 'Коэффициент учитывающий расходы на реализацию';


--
-- Name: COLUMN scp_collateral_app.discount_rate; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.discount_rate IS 'коэффициент для определения справедливой стоимости';


--
-- Name: COLUMN scp_collateral_app.appl_state_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.appl_state_id IS 'Состояние заявки';


--
-- Name: COLUMN scp_collateral_app.is_pres_spouse_cons; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.is_pres_spouse_cons IS 'Предоставление согласия супруги(а) для ФЛ/ИП';


--
-- Name: COLUMN scp_collateral_app.is_pres_guar_pled; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.is_pres_guar_pled IS 'Наличие поручительства залогодателя';


--
-- Name: COLUMN scp_collateral_app.necessity_insurance; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.necessity_insurance IS 'Страхование';


--
-- Name: COLUMN scp_collateral_app.subs_pledge_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.subs_pledge_id IS 'Последующий залог';


--
-- Name: COLUMN scp_collateral_app.total_struct_share; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.total_struct_share IS 'Доля в общей структуре залогового обеспечения';


--
-- Name: COLUMN scp_collateral_app.is_current_concl; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.is_current_concl IS 'Действующее заключение из СУЗ';


--
-- Name: COLUMN scp_collateral_app.conclus_txt; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.conclus_txt IS 'Итоговый вывод из Залогового Заключения';


--
-- Name: COLUMN scp_collateral_app.pledge_concl_state_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.pledge_concl_state_id IS 'Состояние Залогового Заключения';


--
-- Name: COLUMN scp_collateral_app.is_export_suz; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.is_export_suz IS 'Экспортированное заключение из СУЗ';


--
-- Name: COLUMN scp_collateral_app.pledge_conclus_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.pledge_conclus_date IS 'Дата подготовки заключения';


--
-- Name: COLUMN scp_collateral_app.concl_validity_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.concl_validity_date IS 'Срок действия оценки/заключения';


--
-- Name: COLUMN scp_collateral_app.perform_hr_face_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.perform_hr_face_id IS 'Исполнитель Залогового Заключения';


--
-- Name: COLUMN scp_collateral_app.pledge_subject_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.pledge_subject_id IS 'Вид объекта залога (ЦБ)';


--
-- Name: COLUMN scp_collateral_app.collat_common_obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.collat_common_obj_id IS 'Номер объекта залога';


--
-- Name: COLUMN scp_collateral_app.collat_subj_count; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.collat_subj_count IS 'Количество предметов залога';


--
-- Name: COLUMN scp_collateral_app.scp_arm_chief_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.scp_arm_chief_id IS 'Руководитель АРМ';


--
-- Name: COLUMN scp_collateral_app.cp_arm_manager_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.cp_arm_manager_id IS 'Сотрудник АРМ';


--
-- Name: COLUMN scp_collateral_app.scp_info_comment_txt; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.scp_info_comment_txt IS 'Комментарий (инфо)';


--
-- Name: COLUMN scp_collateral_app.scp_info_proj_fin; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.scp_info_proj_fin IS 'Проектное финансирование (инфо)';


--
-- Name: COLUMN scp_collateral_app.scp_info_adress_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.scp_info_adress_str IS 'Адрес местонахождения (инфо)';


--
-- Name: COLUMN scp_collateral_app.scp_info_sec_cost; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.scp_info_sec_cost IS 'Предполагаемая стоимость обеспечения (рубль)';


--
-- Name: COLUMN scp_collateral_app.scp_info_type_na_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.scp_info_type_na_id IS 'Вид предмета залога (из НА) (инфо)';


--
-- Name: COLUMN scp_collateral_app.scp_info_cred_summ; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.scp_info_cred_summ IS 'Сумма кредита (инфо)';


--
-- Name: COLUMN scp_collateral_app.scp_info_type_prod_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.scp_info_type_prod_id IS 'Вид кредитного продукта (инфо)';


--
-- Name: COLUMN scp_collateral_app.scp_info_pledger_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.scp_info_pledger_id IS 'Наименование Залогодателя (ИНН для ЮЛ) (инфо)';


--
-- Name: COLUMN scp_collateral_app.scp_project_fin_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.scp_project_fin_id IS 'Проектное финансирование (инфо)';


--
-- Name: COLUMN scp_collateral_app.scp_fin_proj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.scp_fin_proj_id IS 'Проектное финансирование (инфо)';


--
-- Name: COLUMN scp_collateral_app.scp_quest_dec_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.scp_quest_dec_id IS 'Вид кредитного продукта (инфо)';


--
-- Name: COLUMN scp_collateral_app.add_comm_concl_txt; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.add_comm_concl_txt IS 'Дополнительные комментарии/выводы';


--
-- Name: COLUMN scp_collateral_app.coll_link_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.coll_link_str IS 'Ссылка на СУЗ (без гиперссылки)';


--
-- Name: COLUMN scp_collateral_app.scp_file_req_timest; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.scp_file_req_timest IS 'Дата и время запроса файлов';


--
-- Name: COLUMN scp_collateral_app.scp_info_vnd_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.scp_info_vnd_id IS 'Классификация по ВНД';


--
-- Name: COLUMN scp_collateral_app.quest_decis_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.quest_decis_id IS 'Вид кредитного продукта (инфо)';


--
-- Name: COLUMN scp_collateral_app.testnumber; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_collateral_app.testnumber IS 'Тест_атрибут';


--
-- Name: scp_decision_quest; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.scp_decision_quest (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    app_obj_id bigint,
    scp_sublimit_sum numeric,
    scp_sublimit_purpose bigint,
    app_product_id bigint,
    scp_sublimit_srok numeric,
    scp_sublimit_val bigint,
    scp_subl_bor bigint,
    annotation text,
    question_structure text,
    scp_dec_quest_id bigint,
    scp_gov_program_id bigint,
    source_financing_id bigint,
    credit_purpose_id bigint,
    est_credit_limit numeric,
    is_inactive smallint,
    is_state_program smallint,
    type_loan_id bigint,
    is_afhd smallint,
    rate_type_id bigint,
    product_compound_id bigint,
    amdp_parent_product_id bigint,
    scp_state_id bigint,
    scp_project_ans_link bigint,
    is_product_recalc smallint,
    ord bigint,
    sys_file_id bigint,
    appr_sum numeric,
    product_compound_str character varying(2000),
    loan_type_id bigint,
    part_excl_ship_debitor bigint,
    attr_business_segment bigint,
    scp_num_subl bigint,
    sublimit_sum numeric,
    subl_num character varying(2000),
    is_ca_change_class smallint,
    credit_report_class bigint,
    tech_atr_bool smallint,
    copy_source_quest_id bigint
);



--
-- Name: TABLE scp_decision_quest; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.scp_decision_quest IS 'СКП. Вопросы на принятие решения, SysObjTypeEffective{id=2500978, ident=''SCP_DECISION_QUEST'', name=''СКП. Вопросы на принятие решения'', 13 attributes (13 actualizing)}';


--
-- Name: COLUMN scp_decision_quest.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.id IS 'ID';


--
-- Name: COLUMN scp_decision_quest.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN scp_decision_quest.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN scp_decision_quest.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.name IS 'Name';


--
-- Name: COLUMN scp_decision_quest.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.create_date IS 'Create date';


--
-- Name: COLUMN scp_decision_quest.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.type_id IS 'Тип объекта';


--
-- Name: COLUMN scp_decision_quest.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.status IS 'Status';


--
-- Name: COLUMN scp_decision_quest.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.org_id IS 'Подразделение';


--
-- Name: COLUMN scp_decision_quest.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.user_id IS 'Пользователь';


--
-- Name: COLUMN scp_decision_quest.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN scp_decision_quest.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN scp_decision_quest.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN scp_decision_quest.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN scp_decision_quest.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.is_system IS 'System object';


--
-- Name: COLUMN scp_decision_quest.app_obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.app_obj_id IS 'Ссылка на заявку';


--
-- Name: COLUMN scp_decision_quest.scp_sublimit_sum; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.scp_sublimit_sum IS 'Сумма';


--
-- Name: COLUMN scp_decision_quest.scp_sublimit_purpose; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.scp_sublimit_purpose IS '_Целевое использование';


--
-- Name: COLUMN scp_decision_quest.app_product_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.app_product_id IS 'Продукт';


--
-- Name: COLUMN scp_decision_quest.scp_sublimit_srok; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.scp_sublimit_srok IS 'Срок, мес.';


--
-- Name: COLUMN scp_decision_quest.scp_sublimit_val; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.scp_sublimit_val IS 'Валюта';


--
-- Name: COLUMN scp_decision_quest.scp_subl_bor; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.scp_subl_bor IS 'Заемщик';


--
-- Name: COLUMN scp_decision_quest.annotation; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.annotation IS 'Комментарий';


--
-- Name: COLUMN scp_decision_quest.question_structure; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.question_structure IS 'Суть вопроса';


--
-- Name: COLUMN scp_decision_quest.scp_dec_quest_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.scp_dec_quest_id IS 'Материнский продукт';


--
-- Name: COLUMN scp_decision_quest.scp_gov_program_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.scp_gov_program_id IS '_Госпрограмма';


--
-- Name: COLUMN scp_decision_quest.source_financing_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.source_financing_id IS 'Источник финансирования';


--
-- Name: COLUMN scp_decision_quest.credit_purpose_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.credit_purpose_id IS '_Цель кредитования';


--
-- Name: COLUMN scp_decision_quest.est_credit_limit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.est_credit_limit IS 'Расчетный лимит кредитования (руб.)';


--
-- Name: COLUMN scp_decision_quest.is_inactive; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.is_inactive IS 'Недействующий';


--
-- Name: COLUMN scp_decision_quest.is_state_program; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.is_state_program IS 'Применение госпрограммы';


--
-- Name: COLUMN scp_decision_quest.type_loan_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.type_loan_id IS 'Форма предоставления продукта';


--
-- Name: COLUMN scp_decision_quest.is_afhd; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.is_afhd IS 'АФХД готовится в GD';


--
-- Name: COLUMN scp_decision_quest.rate_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.rate_type_id IS 'Тип ставки';


--
-- Name: COLUMN scp_decision_quest.product_compound_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.product_compound_id IS 'Состав продукта';


--
-- Name: COLUMN scp_decision_quest.amdp_parent_product_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.amdp_parent_product_id IS 'Ссылка на продукт РУМ';


--
-- Name: COLUMN scp_decision_quest.scp_state_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.scp_state_id IS 'Состояние';


--
-- Name: COLUMN scp_decision_quest.scp_project_ans_link; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.scp_project_ans_link IS 'Ссылка на проект решения';


--
-- Name: COLUMN scp_decision_quest.is_product_recalc; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.is_product_recalc IS 'Требуется пересчет продукта на заявке';


--
-- Name: COLUMN scp_decision_quest.ord; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.ord IS 'Порядок';


--
-- Name: COLUMN scp_decision_quest.sys_file_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.sys_file_id IS 'Прикрепленные файлы';


--
-- Name: COLUMN scp_decision_quest.appr_sum; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.appr_sum IS 'Утвержденная сумма';


--
-- Name: COLUMN scp_decision_quest.product_compound_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.product_compound_str IS 'Продукт+состав';


--
-- Name: COLUMN scp_decision_quest.loan_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.loan_type_id IS '_Форма предоставления';


--
-- Name: COLUMN scp_decision_quest.part_excl_ship_debitor; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.part_excl_ship_debitor IS 'Вид продукта';


--
-- Name: COLUMN scp_decision_quest.attr_business_segment; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.attr_business_segment IS '_Сегмент бизнеса клиента';


--
-- Name: COLUMN scp_decision_quest.scp_num_subl; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.scp_num_subl IS 'Номер продукта';


--
-- Name: COLUMN scp_decision_quest.sublimit_sum; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.sublimit_sum IS 'Сумма сублимита';


--
-- Name: COLUMN scp_decision_quest.subl_num; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.subl_num IS 'Номер продукта (строка)';


--
-- Name: COLUMN scp_decision_quest.is_ca_change_class; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.is_ca_change_class IS 'КА изменил вид анализа';


--
-- Name: COLUMN scp_decision_quest.credit_report_class; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.credit_report_class IS 'Вид анализа';


--
-- Name: COLUMN scp_decision_quest.tech_atr_bool; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.tech_atr_bool IS 'Тех атр. отображение подсказки';


--
-- Name: COLUMN scp_decision_quest.copy_source_quest_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_decision_quest.copy_source_quest_id IS 'Ссылка на вопрос - источник копирования';


--
-- Name: scp_dict_product_na; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.scp_dict_product_na (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    ord bigint,
    ident character varying(2000),
    contract_group character varying(2000),
    credit_product character varying(100),
    app_product_id bigint,
    yaig_product_id bigint,
    contr_group_id bigint
);



--
-- Name: TABLE scp_dict_product_na; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.scp_dict_product_na IS 'СКП. Справочник: Продукт из НА, SysObjTypeEffective{id=4186635, ident=''SCP_DICT_PRODUCT_NA'', name=''СКП. Справочник: Продукт из НА'', 17 attributes (17 actualizing)}';


--
-- Name: COLUMN scp_dict_product_na.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_product_na.id IS 'ID';


--
-- Name: COLUMN scp_dict_product_na.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_product_na.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN scp_dict_product_na.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_product_na.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN scp_dict_product_na.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_product_na.name IS 'Name';


--
-- Name: COLUMN scp_dict_product_na.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_product_na.create_date IS 'Create date';


--
-- Name: COLUMN scp_dict_product_na.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_product_na.type_id IS 'Тип объекта';


--
-- Name: COLUMN scp_dict_product_na.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_product_na.status IS 'Status';


--
-- Name: COLUMN scp_dict_product_na.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_product_na.org_id IS 'Подразделение';


--
-- Name: COLUMN scp_dict_product_na.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_product_na.user_id IS 'Пользователь';


--
-- Name: COLUMN scp_dict_product_na.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_product_na.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN scp_dict_product_na.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_product_na.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN scp_dict_product_na.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_product_na.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN scp_dict_product_na.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_product_na.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN scp_dict_product_na.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_product_na.is_system IS 'System object';


--
-- Name: COLUMN scp_dict_product_na.ord; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_product_na.ord IS 'Порядок';


--
-- Name: COLUMN scp_dict_product_na.ident; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_product_na.ident IS 'Идентификатор';


--
-- Name: COLUMN scp_dict_product_na.contract_group; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_product_na.contract_group IS 'Группа договоров в НА';


--
-- Name: COLUMN scp_dict_product_na.credit_product; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_product_na.credit_product IS 'Программа кредитования в НА';


--
-- Name: COLUMN scp_dict_product_na.app_product_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_product_na.app_product_id IS 'Продукт в ГД';


--
-- Name: COLUMN scp_dict_product_na.yaig_product_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_product_na.yaig_product_id IS 'Продукт из УАиГ';


--
-- Name: COLUMN scp_dict_product_na.contr_group_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_product_na.contr_group_id IS 'Контрактная группа из УАиГ';


--
-- Name: scp_dict_rsc_office; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.scp_dict_rsc_office (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    ord bigint,
    ident character varying(2000),
    rsc_office_id bigint
);



--
-- Name: TABLE scp_dict_rsc_office; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.scp_dict_rsc_office IS 'СКП. Справочник: Офисы РЦБ, SysObjTypeEffective{id=4217070, ident=''SCP_DICT_RSC_OFFICE'', name=''СКП. Справочник: Офисы РЦБ'', 16 attributes (16 actualizing)}';


--
-- Name: COLUMN scp_dict_rsc_office.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_rsc_office.id IS 'ID';


--
-- Name: COLUMN scp_dict_rsc_office.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_rsc_office.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN scp_dict_rsc_office.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_rsc_office.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN scp_dict_rsc_office.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_rsc_office.name IS 'Name';


--
-- Name: COLUMN scp_dict_rsc_office.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_rsc_office.create_date IS 'Create date';


--
-- Name: COLUMN scp_dict_rsc_office.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_rsc_office.type_id IS 'Тип объекта';


--
-- Name: COLUMN scp_dict_rsc_office.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_rsc_office.status IS 'Status';


--
-- Name: COLUMN scp_dict_rsc_office.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_rsc_office.org_id IS 'Подразделение';


--
-- Name: COLUMN scp_dict_rsc_office.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_rsc_office.user_id IS 'Пользователь';


--
-- Name: COLUMN scp_dict_rsc_office.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_rsc_office.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN scp_dict_rsc_office.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_rsc_office.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN scp_dict_rsc_office.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_rsc_office.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN scp_dict_rsc_office.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_rsc_office.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN scp_dict_rsc_office.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_rsc_office.is_system IS 'System object';


--
-- Name: COLUMN scp_dict_rsc_office.ord; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_rsc_office.ord IS 'Порядок';


--
-- Name: COLUMN scp_dict_rsc_office.ident; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_rsc_office.ident IS 'Идентификатор';


--
-- Name: COLUMN scp_dict_rsc_office.rsc_office_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_rsc_office.rsc_office_id IS 'Офис РЦБ';


--
-- Name: scp_dict_tech_ctredit; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.scp_dict_tech_ctredit (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    ord bigint,
    ident character varying(2000),
    type_int_code bigint,
    name__en character varying(2000),
    is_available smallint
);



--
-- Name: TABLE scp_dict_tech_ctredit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.scp_dict_tech_ctredit IS 'СКП. Справочник: технология кредитования, SysObjTypeEffective{id=2278963, ident=''SCP_DICT_TECH_CTREDIT'', name=''СКП. Справочник: технология кредитования'', 13 attributes (13 actualizing)}';


--
-- Name: COLUMN scp_dict_tech_ctredit.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_tech_ctredit.id IS 'ID';


--
-- Name: COLUMN scp_dict_tech_ctredit.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_tech_ctredit.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN scp_dict_tech_ctredit.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_tech_ctredit.name IS 'Name';


--
-- Name: COLUMN scp_dict_tech_ctredit.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_tech_ctredit.create_date IS 'Create date';


--
-- Name: COLUMN scp_dict_tech_ctredit.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_tech_ctredit.type_id IS 'Тип объекта';


--
-- Name: COLUMN scp_dict_tech_ctredit.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_tech_ctredit.status IS 'Status';


--
-- Name: COLUMN scp_dict_tech_ctredit.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_tech_ctredit.org_id IS 'Подразделение';


--
-- Name: COLUMN scp_dict_tech_ctredit.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_tech_ctredit.user_id IS 'Пользователь';


--
-- Name: COLUMN scp_dict_tech_ctredit.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_tech_ctredit.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN scp_dict_tech_ctredit.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_tech_ctredit.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN scp_dict_tech_ctredit.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_tech_ctredit.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN scp_dict_tech_ctredit.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_tech_ctredit.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN scp_dict_tech_ctredit.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_tech_ctredit.is_system IS 'System object';


--
-- Name: COLUMN scp_dict_tech_ctredit.ord; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_tech_ctredit.ord IS 'Порядок';


--
-- Name: COLUMN scp_dict_tech_ctredit.ident; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_tech_ctredit.ident IS 'Идентификатор';


--
-- Name: COLUMN scp_dict_tech_ctredit.type_int_code; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_tech_ctredit.type_int_code IS 'Код типа технологии';


--
-- Name: COLUMN scp_dict_tech_ctredit.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_tech_ctredit.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN scp_dict_tech_ctredit.is_available; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_dict_tech_ctredit.is_available IS 'Доступен для выбора';


--
-- Name: scp_gov_program_dict; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.scp_gov_program_dict (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    ord bigint,
    ident character varying(2000),
    scp_max_margin_val numeric,
    scp_max_pref_rate_val numeric,
    scp_subsidy_rate_val numeric,
    type_gov_prog_id bigint,
    upp_gov_prog_dict_id bigint,
    date_end_cb timestamp(6) without time zone,
    scp_fund_rate_val numeric
);



--
-- Name: TABLE scp_gov_program_dict; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.scp_gov_program_dict IS 'СКП. Госпрограмма по вопросу на принятие решения, SysObjTypeEffective{id=3659470, ident=''SCP_GOV_PROGRAM_DICT'', name=''СКП. Госпрограмма по вопросу на принятие решения'', 14 attributes (14 actualizing)}';


--
-- Name: COLUMN scp_gov_program_dict.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_gov_program_dict.id IS 'ID';


--
-- Name: COLUMN scp_gov_program_dict.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_gov_program_dict.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN scp_gov_program_dict.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_gov_program_dict.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN scp_gov_program_dict.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_gov_program_dict.name IS 'Name';


--
-- Name: COLUMN scp_gov_program_dict.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_gov_program_dict.create_date IS 'Create date';


--
-- Name: COLUMN scp_gov_program_dict.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_gov_program_dict.type_id IS 'Тип объекта';


--
-- Name: COLUMN scp_gov_program_dict.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_gov_program_dict.status IS 'Status';


--
-- Name: COLUMN scp_gov_program_dict.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_gov_program_dict.org_id IS 'Подразделение';


--
-- Name: COLUMN scp_gov_program_dict.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_gov_program_dict.user_id IS 'Пользователь';


--
-- Name: COLUMN scp_gov_program_dict.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_gov_program_dict.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN scp_gov_program_dict.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_gov_program_dict.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN scp_gov_program_dict.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_gov_program_dict.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN scp_gov_program_dict.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_gov_program_dict.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN scp_gov_program_dict.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_gov_program_dict.is_system IS 'System object';


--
-- Name: COLUMN scp_gov_program_dict.ord; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_gov_program_dict.ord IS 'Порядок';


--
-- Name: COLUMN scp_gov_program_dict.ident; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_gov_program_dict.ident IS 'Идентификатор';


--
-- Name: COLUMN scp_gov_program_dict.scp_max_margin_val; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_gov_program_dict.scp_max_margin_val IS 'Маржа';


--
-- Name: COLUMN scp_gov_program_dict.scp_max_pref_rate_val; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_gov_program_dict.scp_max_pref_rate_val IS 'Ставка клиента';


--
-- Name: COLUMN scp_gov_program_dict.scp_subsidy_rate_val; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_gov_program_dict.scp_subsidy_rate_val IS 'Субсидия';


--
-- Name: COLUMN scp_gov_program_dict.type_gov_prog_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_gov_program_dict.type_gov_prog_id IS 'Вид госпрограммы';


--
-- Name: COLUMN scp_gov_program_dict.upp_gov_prog_dict_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_gov_program_dict.upp_gov_prog_dict_id IS 'Верхнеуровневая программа';


--
-- Name: COLUMN scp_gov_program_dict.date_end_cb; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_gov_program_dict.date_end_cb IS 'Дата окончания действия';


--
-- Name: COLUMN scp_gov_program_dict.scp_fund_rate_val; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_gov_program_dict.scp_fund_rate_val IS 'Ставка фондирования';


--
-- Name: scp_part_sec_expertise; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.scp_part_sec_expertise (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    afl_doc_num character varying(2000),
    afl_doc_data timestamp without time zone,
    afp_state_id bigint,
    emp_id bigint,
    sec_date_check timestamp(6) without time zone,
    revoke_reason character varying(2000),
    expertise_obj_id bigint,
    deleg_region_id bigint,
    risk_zone_id bigint,
    sec_expertise_id bigint,
    sec_ch_res_list bigint,
    ses_resp_user_id bigint,
    check_completed smallint,
    ses_conf_user_id bigint,
    check_button_vis smallint,
    repeat_check bigint,
    finish_task_date timestamp(6) without time zone,
    psb_office_id bigint,
    sec_check_auto_date timestamp(6) without time zone,
    ident character varying(2000),
    sf_exp_term_date timestamp(6) without time zone,
    end_date timestamp(6) without time zone,
    reason_revision_str character varying(2000),
    reason_restart_str character varying(2000),
    reason_cancel_str character varying(2000),
    csd_expertise_obj_id bigint,
    sf_sec_rs_emp_id bigint
);



--
-- Name: TABLE scp_part_sec_expertise; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.scp_part_sec_expertise IS 'СКП. Экспертиза СЭБ участника сделки, SysObjTypeEffective{id=2500977, ident=''SCP_PART_SEC_EXPERTISE'', name=''СКП. Экспертиза СЭБ участника сделки'', 21 attributes (21 actualizing)}';


--
-- Name: COLUMN scp_part_sec_expertise.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.id IS 'ID';


--
-- Name: COLUMN scp_part_sec_expertise.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN scp_part_sec_expertise.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN scp_part_sec_expertise.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.name IS 'Name';


--
-- Name: COLUMN scp_part_sec_expertise.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.create_date IS 'Create date';


--
-- Name: COLUMN scp_part_sec_expertise.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.type_id IS 'Тип объекта';


--
-- Name: COLUMN scp_part_sec_expertise.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.status IS 'Status';


--
-- Name: COLUMN scp_part_sec_expertise.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.org_id IS 'Подразделение';


--
-- Name: COLUMN scp_part_sec_expertise.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.user_id IS 'Пользователь';


--
-- Name: COLUMN scp_part_sec_expertise.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN scp_part_sec_expertise.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN scp_part_sec_expertise.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN scp_part_sec_expertise.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN scp_part_sec_expertise.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.is_system IS 'System object';


--
-- Name: COLUMN scp_part_sec_expertise.afl_doc_num; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.afl_doc_num IS 'Номер документа';


--
-- Name: COLUMN scp_part_sec_expertise.afl_doc_data; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.afl_doc_data IS 'Дата документа';


--
-- Name: COLUMN scp_part_sec_expertise.afp_state_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.afp_state_id IS 'Состояние';


--
-- Name: COLUMN scp_part_sec_expertise.emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.emp_id IS 'Ответственный менеджер';


--
-- Name: COLUMN scp_part_sec_expertise.sec_date_check; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.sec_date_check IS 'Дата проверки (итоговая)';


--
-- Name: COLUMN scp_part_sec_expertise.revoke_reason; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.revoke_reason IS 'Причина отзыва';


--
-- Name: COLUMN scp_part_sec_expertise.expertise_obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.expertise_obj_id IS 'Объект экспертизы';


--
-- Name: COLUMN scp_part_sec_expertise.deleg_region_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.deleg_region_id IS 'Регион назначения';


--
-- Name: COLUMN scp_part_sec_expertise.risk_zone_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.risk_zone_id IS 'Зона риска';


--
-- Name: COLUMN scp_part_sec_expertise.sec_expertise_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.sec_expertise_id IS 'Экспертиза СЭБ';


--
-- Name: COLUMN scp_part_sec_expertise.sec_ch_res_list; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.sec_ch_res_list IS 'Результаты проверки';


--
-- Name: COLUMN scp_part_sec_expertise.ses_resp_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.ses_resp_user_id IS 'Пользователь для покраски (технический)';


--
-- Name: COLUMN scp_part_sec_expertise.check_completed; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.check_completed IS 'Проверка произведена';


--
-- Name: COLUMN scp_part_sec_expertise.ses_conf_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.ses_conf_user_id IS 'Пользователь для подтверждения проверки (технический)';


--
-- Name: COLUMN scp_part_sec_expertise.check_button_vis; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.check_button_vis IS 'Видимость кнопки подтверждения проверки';


--
-- Name: COLUMN scp_part_sec_expertise.repeat_check; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.repeat_check IS 'Повторные проверки';


--
-- Name: COLUMN scp_part_sec_expertise.finish_task_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.finish_task_date IS 'Дата и время завершения задачи';


--
-- Name: COLUMN scp_part_sec_expertise.psb_office_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.psb_office_id IS 'Офис ПСБ';


--
-- Name: COLUMN scp_part_sec_expertise.sec_check_auto_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.sec_check_auto_date IS 'Дата завершения автопроверок';


--
-- Name: COLUMN scp_part_sec_expertise.ident; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.ident IS 'Сист. Идентификатор';


--
-- Name: COLUMN scp_part_sec_expertise.sf_exp_term_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.sf_exp_term_date IS 'Срок действия';


--
-- Name: COLUMN scp_part_sec_expertise.end_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.end_date IS 'Дата завершения экспертизы';


--
-- Name: COLUMN scp_part_sec_expertise.reason_revision_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.reason_revision_str IS 'Причина доработки';


--
-- Name: COLUMN scp_part_sec_expertise.reason_restart_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.reason_restart_str IS 'Причина перезапуска';


--
-- Name: COLUMN scp_part_sec_expertise.reason_cancel_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.reason_cancel_str IS 'Причина отмены';


--
-- Name: COLUMN scp_part_sec_expertise.csd_expertise_obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.csd_expertise_obj_id IS 'Объект экспертизы (КОД)';


--
-- Name: COLUMN scp_part_sec_expertise.sf_sec_rs_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_part_sec_expertise.sf_sec_rs_emp_id IS 'Ответственный РС (ФС)';


--
-- Name: scp_prod_comm_dict; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.scp_prod_comm_dict (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    ord bigint,
    ident character varying(2000),
    scp_payment_shedule_str character varying(2000),
    scp_comiss_size_str character varying(2000),
    value_comment character varying(2000),
    fare_description character varying(2000),
    is_ho_application smallint,
    com_val_proc numeric,
    is_for_state_program smallint,
    gov_prog_value bigint,
    payment_schedule_id bigint,
    new_com_val_proc numeric,
    scp_gov_program_id bigint,
    is_corp_tech_bool smallint,
    is_product_log_bool smallint,
    is_actual_comission smallint,
    is_apk_tech_bool smallint,
    change_comiss_dict_id bigint,
    bank_val_sum numeric
);



--
-- Name: TABLE scp_prod_comm_dict; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.scp_prod_comm_dict IS 'СКП. Справочник: комиссии продуктов СКП, SysObjTypeEffective{id=3701708, ident=''SCP_PROD_COMM_DICT'', name=''СКП. Справочник: комиссии продуктов СКП'', 14 attributes (14 actualizing)}';


--
-- Name: COLUMN scp_prod_comm_dict.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.id IS 'ID';


--
-- Name: COLUMN scp_prod_comm_dict.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN scp_prod_comm_dict.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN scp_prod_comm_dict.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.name IS 'Name';


--
-- Name: COLUMN scp_prod_comm_dict.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.create_date IS 'Create date';


--
-- Name: COLUMN scp_prod_comm_dict.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.type_id IS 'Тип объекта';


--
-- Name: COLUMN scp_prod_comm_dict.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.status IS 'Status';


--
-- Name: COLUMN scp_prod_comm_dict.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.org_id IS 'Подразделение';


--
-- Name: COLUMN scp_prod_comm_dict.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.user_id IS 'Пользователь';


--
-- Name: COLUMN scp_prod_comm_dict.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN scp_prod_comm_dict.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN scp_prod_comm_dict.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN scp_prod_comm_dict.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN scp_prod_comm_dict.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.is_system IS 'System object';


--
-- Name: COLUMN scp_prod_comm_dict.ord; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.ord IS 'Порядок';


--
-- Name: COLUMN scp_prod_comm_dict.ident; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.ident IS 'Идентификатор';


--
-- Name: COLUMN scp_prod_comm_dict.scp_payment_shedule_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.scp_payment_shedule_str IS 'Порядок выплаты';


--
-- Name: COLUMN scp_prod_comm_dict.scp_comiss_size_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.scp_comiss_size_str IS 'Размер комиссии';


--
-- Name: COLUMN scp_prod_comm_dict.value_comment; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.value_comment IS 'Комментарий к значению';


--
-- Name: COLUMN scp_prod_comm_dict.fare_description; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.fare_description IS 'Описание тарифа';


--
-- Name: COLUMN scp_prod_comm_dict.is_ho_application; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.is_ho_application IS 'Заявка ГО';


--
-- Name: COLUMN scp_prod_comm_dict.com_val_proc; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.com_val_proc IS 'Значение комиссии (%)';


--
-- Name: COLUMN scp_prod_comm_dict.is_for_state_program; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.is_for_state_program IS 'Комиссия для госпрограммы';


--
-- Name: COLUMN scp_prod_comm_dict.gov_prog_value; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.gov_prog_value IS 'Тип значения по госпрограмме';


--
-- Name: COLUMN scp_prod_comm_dict.payment_schedule_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.payment_schedule_id IS 'Порядок выплаты';


--
-- Name: COLUMN scp_prod_comm_dict.new_com_val_proc; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.new_com_val_proc IS '_Размер (%) предлагаемый';


--
-- Name: COLUMN scp_prod_comm_dict.scp_gov_program_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.scp_gov_program_id IS 'Госпрограмма (справочные значения)';


--
-- Name: COLUMN scp_prod_comm_dict.is_corp_tech_bool; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.is_corp_tech_bool IS 'Корп. технология';


--
-- Name: COLUMN scp_prod_comm_dict.is_product_log_bool; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.is_product_log_bool IS 'Продуктовая логика МСБ';


--
-- Name: COLUMN scp_prod_comm_dict.is_actual_comission; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.is_actual_comission IS 'Актуальность комиссии';


--
-- Name: COLUMN scp_prod_comm_dict.is_apk_tech_bool; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.is_apk_tech_bool IS 'Технология кредитования АПК';


--
-- Name: COLUMN scp_prod_comm_dict.change_comiss_dict_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.change_comiss_dict_id IS 'Вид диапазона';


--
-- Name: COLUMN scp_prod_comm_dict.bank_val_sum; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_comm_dict.bank_val_sum IS 'Размер (руб)';


--
-- Name: scp_prod_guar_dict; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.scp_prod_guar_dict (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    ord bigint,
    ident character varying(2000),
    scp_comiss_size_str character varying(2000),
    scp_payment_shedule_str character varying(2000),
    value_comment character varying(2000),
    com_val_proc numeric,
    prod_guarant_dict_id bigint,
    gov_prog_value bigint,
    payment_schedule_id bigint,
    new_com_val_proc numeric,
    scp_gov_program_id bigint
);



--
-- Name: TABLE scp_prod_guar_dict; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.scp_prod_guar_dict IS 'СКП. Справочник: гарантии продуктов СКП, SysObjTypeEffective{id=3797167, ident=''SCP_PROD_GUAR_DICT'', name=''СКП. Справочник: гарантии продуктов СКП'', 18 attributes (18 actualizing)}';


--
-- Name: COLUMN scp_prod_guar_dict.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guar_dict.id IS 'ID';


--
-- Name: COLUMN scp_prod_guar_dict.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guar_dict.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN scp_prod_guar_dict.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guar_dict.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN scp_prod_guar_dict.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guar_dict.name IS 'Name';


--
-- Name: COLUMN scp_prod_guar_dict.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guar_dict.create_date IS 'Create date';


--
-- Name: COLUMN scp_prod_guar_dict.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guar_dict.type_id IS 'Тип объекта';


--
-- Name: COLUMN scp_prod_guar_dict.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guar_dict.status IS 'Status';


--
-- Name: COLUMN scp_prod_guar_dict.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guar_dict.org_id IS 'Подразделение';


--
-- Name: COLUMN scp_prod_guar_dict.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guar_dict.user_id IS 'Пользователь';


--
-- Name: COLUMN scp_prod_guar_dict.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guar_dict.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN scp_prod_guar_dict.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guar_dict.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN scp_prod_guar_dict.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guar_dict.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN scp_prod_guar_dict.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guar_dict.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN scp_prod_guar_dict.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guar_dict.is_system IS 'System object';


--
-- Name: COLUMN scp_prod_guar_dict.ord; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guar_dict.ord IS 'Порядок';


--
-- Name: COLUMN scp_prod_guar_dict.ident; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guar_dict.ident IS 'Идентификатор';


--
-- Name: COLUMN scp_prod_guar_dict.scp_comiss_size_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guar_dict.scp_comiss_size_str IS 'Размер комиссии (строка)';


--
-- Name: COLUMN scp_prod_guar_dict.scp_payment_shedule_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guar_dict.scp_payment_shedule_str IS 'Порядок выплаты';


--
-- Name: COLUMN scp_prod_guar_dict.value_comment; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guar_dict.value_comment IS 'Комментарий к значению';


--
-- Name: COLUMN scp_prod_guar_dict.com_val_proc; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guar_dict.com_val_proc IS 'Размер комиссии (%)';


--
-- Name: COLUMN scp_prod_guar_dict.prod_guarant_dict_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guar_dict.prod_guarant_dict_id IS 'Гарантия';


--
-- Name: COLUMN scp_prod_guar_dict.gov_prog_value; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guar_dict.gov_prog_value IS 'Тип значения по госпрограмме';


--
-- Name: COLUMN scp_prod_guar_dict.payment_schedule_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guar_dict.payment_schedule_id IS 'Порядок выплаты';


--
-- Name: COLUMN scp_prod_guar_dict.new_com_val_proc; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guar_dict.new_com_val_proc IS '_Размер (%) предлагаемый';


--
-- Name: COLUMN scp_prod_guar_dict.scp_gov_program_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guar_dict.scp_gov_program_id IS 'Госпрограмма (справочные значения)';


--
-- Name: scp_prod_guarant_dict; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.scp_prod_guarant_dict (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    ord bigint,
    ident character varying(2000),
    guarantee_type_id bigint,
    bank_val_proc numeric,
    bank_val_sum numeric,
    sum_from numeric,
    sum_to numeric
);



--
-- Name: TABLE scp_prod_guarant_dict; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.scp_prod_guarant_dict IS 'СКП. Справочник: гарантии продуктов СКП, SysObjTypeEffective{id=3791305, ident=''SCP_PROD_GUARANT_DICT'', name=''СКП. Справочник: гарантии продуктов СКП'', 14 attributes (14 actualizing)}';


--
-- Name: COLUMN scp_prod_guarant_dict.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guarant_dict.id IS 'ID';


--
-- Name: COLUMN scp_prod_guarant_dict.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guarant_dict.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN scp_prod_guarant_dict.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guarant_dict.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN scp_prod_guarant_dict.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guarant_dict.name IS 'Name';


--
-- Name: COLUMN scp_prod_guarant_dict.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guarant_dict.create_date IS 'Create date';


--
-- Name: COLUMN scp_prod_guarant_dict.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guarant_dict.type_id IS 'Тип объекта';


--
-- Name: COLUMN scp_prod_guarant_dict.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guarant_dict.status IS 'Status';


--
-- Name: COLUMN scp_prod_guarant_dict.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guarant_dict.org_id IS 'Подразделение';


--
-- Name: COLUMN scp_prod_guarant_dict.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guarant_dict.user_id IS 'Пользователь';


--
-- Name: COLUMN scp_prod_guarant_dict.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guarant_dict.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN scp_prod_guarant_dict.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guarant_dict.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN scp_prod_guarant_dict.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guarant_dict.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN scp_prod_guarant_dict.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guarant_dict.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN scp_prod_guarant_dict.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guarant_dict.is_system IS 'System object';


--
-- Name: COLUMN scp_prod_guarant_dict.ord; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guarant_dict.ord IS 'Порядок';


--
-- Name: COLUMN scp_prod_guarant_dict.ident; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guarant_dict.ident IS 'Идентификатор';


--
-- Name: COLUMN scp_prod_guarant_dict.guarantee_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guarant_dict.guarantee_type_id IS 'Вид гарантии';


--
-- Name: COLUMN scp_prod_guarant_dict.bank_val_proc; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guarant_dict.bank_val_proc IS 'Размер (руб)';


--
-- Name: COLUMN scp_prod_guarant_dict.bank_val_sum; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guarant_dict.bank_val_sum IS 'Размер (руб)';


--
-- Name: COLUMN scp_prod_guarant_dict.sum_from; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guarant_dict.sum_from IS 'Сумма от (руб)';


--
-- Name: COLUMN scp_prod_guarant_dict.sum_to; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_prod_guarant_dict.sum_to IS 'Сумма до (руб)';


--
-- Name: scp_project_ans; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.scp_project_ans (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    req_link_id bigint,
    question_link_id bigint,
    voting_km_id bigint,
    voting_fm_id bigint,
    draft_decision_id bigint,
    urm_undwrt_decision_id bigint,
    decis_level_id bigint,
    doc_num character varying(2000),
    doc_data timestamp(6) without time zone,
    is_under_3_years_exp smallint,
    scp_loan_sign_id bigint,
    loan_sign_st_ot_id bigint,
    okpd2 character varying(2000),
    curret_limit_gsl numeric,
    new_limit_gsl numeric,
    current_limit_borow numeric,
    new_limit_borow numeric,
    set_matrix_limit numeric,
    real_estate_class_id bigint,
    loan_type_id bigint,
    amount_rub numeric,
    credit_line_term numeric,
    summ_tranche numeric,
    tranche_term numeric,
    monthly_contribution numeric,
    payment_delay_months bigint,
    amount_blanc_deal numeric,
    blanc_deal_asmt_result bigint,
    individual_repay_sched text,
    rate_increase_blanc numeric,
    repayment_type_id bigint,
    susp_cond_prev_id bigint,
    curator_head_id bigint,
    resp_head_cm_id bigint,
    credit_analyst_id bigint,
    is_infinite_vkl smallint,
    is_blanc_credit smallint,
    exp_limit_credit_rub numeric,
    refer_empl bigint,
    spec_fa bigint,
    attr_market_val numeric,
    attr_fair_val numeric,
    product_security numeric,
    attr_collateral_val numeric,
    collateral_monit bigint,
    limit_confirmation bigint,
    amdp_parent_product_id bigint,
    scp_state_id bigint,
    rm_ra_decis_level_id bigint,
    voting_rm_id bigint,
    plan_deal_date timestamp(6) without time zone,
    is_active_pj smallint,
    okved_activity_id bigint,
    is_poci_active smallint,
    mon_col_type_id bigint,
    prod_sec numeric,
    el_individual numeric,
    clc_grade_id bigint,
    resp_risk_manager_id bigint,
    cancel_manage_desic character varying(2000),
    cancel_manag_desic text,
    undwrit_appl_id bigint,
    is_refresh_state smallint,
    industry_code_id bigint,
    scp_subl_bor bigint,
    client_type_id bigint,
    gsl_comparison character varying(2000),
    clc_zone_id bigint,
    restruct_init_id bigint,
    monit_viol_txt text,
    analys_res_cl_txt text,
    analys_res_cl_restr_id bigint,
    deal_change_txt text,
    changed_decision_num character varying(2000),
    deal_change_restr_txt text,
    scp_type_restruct_id bigint,
    min_decis_level_id bigint,
    modif_num_deals character varying(2000),
    scp_matrix_type bigint,
    is_need_agr_cd_co smallint,
    state_id bigint,
    is_old_visual_needed smallint,
    change_initiator_id bigint,
    scp_is_individual smallint,
    lidm_cur_limit numeric,
    lidm_cur_limit_new numeric,
    scp_bg_owner_lidm bigint,
    scp_chief_ca_id bigint,
    total_looped_sum numeric,
    gsl_compare_txt text,
    limit_confirm_str character varying(2000),
    proj_city_str character varying(2000),
    is_primary_preparation smallint,
    req_type_id bigint,
    is_cov_bank_garant smallint,
    memo_deal_log smallint,
    ns_deal_cond_log smallint,
    confirm_cred_limit_log smallint,
    confirm_csd_log smallint,
    limit_due_date timestamp(6) without time zone,
    limit_review_date timestamp(6) without time zone,
    credit_group_id bigint,
    raroc_roe numeric,
    weighted_margin numeric,
    raroc_perc numeric,
    is_risk_consideration smallint
);



--
-- Name: TABLE scp_project_ans; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.scp_project_ans IS 'СКП. Проект решения, SysObjTypeEffective{id=3646608, ident=''SCP_PROJECT_ANS'', name=''СКП. Проект решения'', 15 attributes (15 actualizing)}';


--
-- Name: COLUMN scp_project_ans.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.id IS 'ID';


--
-- Name: COLUMN scp_project_ans.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN scp_project_ans.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN scp_project_ans.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.name IS 'Name';


--
-- Name: COLUMN scp_project_ans.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.create_date IS 'Create date';


--
-- Name: COLUMN scp_project_ans.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.type_id IS 'Тип объекта';


--
-- Name: COLUMN scp_project_ans.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.status IS 'Status';


--
-- Name: COLUMN scp_project_ans.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.org_id IS 'Подразделение';


--
-- Name: COLUMN scp_project_ans.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.user_id IS 'Пользователь';


--
-- Name: COLUMN scp_project_ans.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN scp_project_ans.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN scp_project_ans.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN scp_project_ans.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN scp_project_ans.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.is_system IS 'System object';


--
-- Name: COLUMN scp_project_ans.req_link_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.req_link_id IS 'Ссылка на заявку';


--
-- Name: COLUMN scp_project_ans.question_link_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.question_link_id IS 'Ссылка на вопрос';


--
-- Name: COLUMN scp_project_ans.voting_km_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.voting_km_id IS 'Голосующий КМ';


--
-- Name: COLUMN scp_project_ans.voting_fm_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.voting_fm_id IS 'Голосующий ФМ';


--
-- Name: COLUMN scp_project_ans.draft_decision_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.draft_decision_id IS 'Проект решения';


--
-- Name: COLUMN scp_project_ans.urm_undwrt_decision_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.urm_undwrt_decision_id IS 'Решение УРМ';


--
-- Name: COLUMN scp_project_ans.decis_level_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.decis_level_id IS 'Уровень принятия решения';


--
-- Name: COLUMN scp_project_ans.doc_num; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.doc_num IS 'Номер документа';


--
-- Name: COLUMN scp_project_ans.doc_data; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.doc_data IS 'Дата документа';


--
-- Name: COLUMN scp_project_ans.is_under_3_years_exp; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.is_under_3_years_exp IS 'Срок ведения бизнеса менее 3х лет';


--
-- Name: COLUMN scp_project_ans.scp_loan_sign_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.scp_loan_sign_id IS 'Признак ссуды для внесения в ИСУБД Новая Афина';


--
-- Name: COLUMN scp_project_ans.loan_sign_st_ot_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.loan_sign_st_ot_id IS 'Код сделки';


--
-- Name: COLUMN scp_project_ans.okpd2; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.okpd2 IS 'ОКПД2';


--
-- Name: COLUMN scp_project_ans.curret_limit_gsl; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.curret_limit_gsl IS 'Текущий лимит кредитования по ГСЛ (в валюте утверждаемого кредита), в т.ч. по предоставленным банковским гарантиям, кроме продуктов в рамках льготного финансирования (ПП 422 и ПП 696)';


--
-- Name: COLUMN scp_project_ans.new_limit_gsl; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.new_limit_gsl IS 'Лимит кредитования по ГСЛ с учетом нового лимита, кроме продуктов в рамках льготного финансирования (ПП 422 и ПП 696)';


--
-- Name: COLUMN scp_project_ans.current_limit_borow; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.current_limit_borow IS 'Текущий установленный лимит по Заемщику  по продуктам в рамках льготного финансирования (ПП 422 и ПП 696)';


--
-- Name: COLUMN scp_project_ans.new_limit_borow; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.new_limit_borow IS 'Лимит по Заемщику с учетом нового лимита  по продуктам в рамках льготного финансирования (ПП 422 и ПП 696)';


--
-- Name: COLUMN scp_project_ans.set_matrix_limit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.set_matrix_limit IS 'Лимит кредитования, установленный (принятый) Уполномоченными менеджерами на Матрице полномочий в рамках технологий кредитования МСБ';


--
-- Name: COLUMN scp_project_ans.real_estate_class_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.real_estate_class_id IS 'Классификация недвижимого имущества';


--
-- Name: COLUMN scp_project_ans.loan_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.loan_type_id IS '_Форма предоставления';


--
-- Name: COLUMN scp_project_ans.amount_rub; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.amount_rub IS 'Сумма (руб.) для реестра';


--
-- Name: COLUMN scp_project_ans.credit_line_term; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.credit_line_term IS '_Срок кредитной линии (кредита) (мес.)';


--
-- Name: COLUMN scp_project_ans.summ_tranche; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.summ_tranche IS '_Сумма транша';


--
-- Name: COLUMN scp_project_ans.tranche_term; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.tranche_term IS '_Срок транша (мес.)';


--
-- Name: COLUMN scp_project_ans.monthly_contribution; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.monthly_contribution IS '_Ежемесячный взнос, руб.';


--
-- Name: COLUMN scp_project_ans.payment_delay_months; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.payment_delay_months IS '_Отсрочка платежа (мес.)';


--
-- Name: COLUMN scp_project_ans.amount_blanc_deal; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.amount_blanc_deal IS '_Сумма бланкочасти рассчитанная по сделке исходя из указанного обеспечения';


--
-- Name: COLUMN scp_project_ans.blanc_deal_asmt_result; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.blanc_deal_asmt_result IS '_Результат оценки допустимой бланко-части по сделке';


--
-- Name: COLUMN scp_project_ans.individual_repay_sched; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.individual_repay_sched IS '_Индивидуальный график погашения';


--
-- Name: COLUMN scp_project_ans.rate_increase_blanc; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.rate_increase_blanc IS '_Увеличение ставки для бланкового кредитования';


--
-- Name: COLUMN scp_project_ans.repayment_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.repayment_type_id IS '_Форма погашения';


--
-- Name: COLUMN scp_project_ans.susp_cond_prev_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.susp_cond_prev_id IS '_Выполнены ли отлагательные условия по ранее принятым решениям?';


--
-- Name: COLUMN scp_project_ans.curator_head_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.curator_head_id IS 'Куратор ГО';


--
-- Name: COLUMN scp_project_ans.resp_head_cm_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.resp_head_cm_id IS 'Руководитель КМ';


--
-- Name: COLUMN scp_project_ans.credit_analyst_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.credit_analyst_id IS 'Кредитный аналитик';


--
-- Name: COLUMN scp_project_ans.is_infinite_vkl; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.is_infinite_vkl IS '_Наличие опции "Вечная ВКЛ"';


--
-- Name: COLUMN scp_project_ans.is_blanc_credit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.is_blanc_credit IS '_Бланковое кредитование';


--
-- Name: COLUMN scp_project_ans.exp_limit_credit_rub; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.exp_limit_credit_rub IS 'Расчетный лимит кредитования (руб.)';


--
-- Name: COLUMN scp_project_ans.refer_empl; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.refer_empl IS 'Сотрудник, привлекший клиента';


--
-- Name: COLUMN scp_project_ans.spec_fa; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.spec_fa IS '_Специалист, проводивший финансовый анализ';


--
-- Name: COLUMN scp_project_ans.attr_market_val; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.attr_market_val IS 'Рыночная стоимость';


--
-- Name: COLUMN scp_project_ans.attr_fair_val; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.attr_fair_val IS 'Справедливая стоимость';


--
-- Name: COLUMN scp_project_ans.product_security; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.product_security IS '_Обеспеченность продукта (руб.)';


--
-- Name: COLUMN scp_project_ans.attr_collateral_val; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.attr_collateral_val IS 'Залоговая стоимость';


--
-- Name: COLUMN scp_project_ans.collateral_monit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.collateral_monit IS '_Периодичность мониторинга залога';


--
-- Name: COLUMN scp_project_ans.limit_confirmation; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.limit_confirmation IS 'Подтверждение лимита';


--
-- Name: COLUMN scp_project_ans.amdp_parent_product_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.amdp_parent_product_id IS 'Ссылка на продукт РУМ';


--
-- Name: COLUMN scp_project_ans.scp_state_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.scp_state_id IS 'Итоговое решение';


--
-- Name: COLUMN scp_project_ans.rm_ra_decis_level_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.rm_ra_decis_level_id IS 'Уровень принятия решения РМ РА';


--
-- Name: COLUMN scp_project_ans.voting_rm_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.voting_rm_id IS 'Риск-менеджер';


--
-- Name: COLUMN scp_project_ans.plan_deal_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.plan_deal_date IS 'Плановая дата сделки';


--
-- Name: COLUMN scp_project_ans.is_active_pj; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.is_active_pj IS 'Экспертиза проф.су на выдачу запущена';


--
-- Name: COLUMN scp_project_ans.okved_activity_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.okved_activity_id IS '_Вид деятельности (по ОКВЭД)';


--
-- Name: COLUMN scp_project_ans.is_poci_active; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.is_poci_active IS 'POCI-актив';


--
-- Name: COLUMN scp_project_ans.mon_col_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.mon_col_type_id IS '_Тип залога для мониторинга';


--
-- Name: COLUMN scp_project_ans.prod_sec; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.prod_sec IS 'Обеспеченность продукта (%)';


--
-- Name: COLUMN scp_project_ans.el_individual; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.el_individual IS 'EL индивидуальный';


--
-- Name: COLUMN scp_project_ans.clc_grade_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.clc_grade_id IS 'Посчитанный из АСПР грейд';


--
-- Name: COLUMN scp_project_ans.resp_risk_manager_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.resp_risk_manager_id IS 'Уполномоченный риск-менеджер';


--
-- Name: COLUMN scp_project_ans.cancel_manage_desic; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.cancel_manage_desic IS 'Отменить Решение уполномоченных менеджеров №';


--
-- Name: COLUMN scp_project_ans.cancel_manag_desic; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.cancel_manag_desic IS '_Отменить Решение уполномоченных менеджеров №';


--
-- Name: COLUMN scp_project_ans.undwrit_appl_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.undwrit_appl_id IS 'Заявка РМ РА';


--
-- Name: COLUMN scp_project_ans.is_refresh_state; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.is_refresh_state IS 'Состояние Залоговых Заключений не пересчитывается';


--
-- Name: COLUMN scp_project_ans.industry_code_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.industry_code_id IS 'Код отрасли';


--
-- Name: COLUMN scp_project_ans.scp_subl_bor; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.scp_subl_bor IS 'Заемщик';


--
-- Name: COLUMN scp_project_ans.client_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.client_type_id IS 'Тип клиента';


--
-- Name: COLUMN scp_project_ans.gsl_comparison; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.gsl_comparison IS '_Состав ГСЛ (для сравнения)';


--
-- Name: COLUMN scp_project_ans.clc_zone_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.clc_zone_id IS 'Посчитанная из АСПР зона';


--
-- Name: COLUMN scp_project_ans.restruct_init_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.restruct_init_id IS 'Инициатор реструктуризации';


--
-- Name: COLUMN scp_project_ans.monit_viol_txt; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.monit_viol_txt IS 'Нарушение мониторинга (ручной ввод)';


--
-- Name: COLUMN scp_project_ans.analys_res_cl_txt; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.analys_res_cl_txt IS 'Итоговый результат анализа клиента (ручной ввод)';


--
-- Name: COLUMN scp_project_ans.analys_res_cl_restr_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.analys_res_cl_restr_id IS 'Итоговый результат анализа клиента (для реструктуризации)';


--
-- Name: COLUMN scp_project_ans.deal_change_txt; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.deal_change_txt IS 'Изменение сделки/условий (ручной ввод)';


--
-- Name: COLUMN scp_project_ans.changed_decision_num; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.changed_decision_num IS 'Номера изменяемых решений';


--
-- Name: COLUMN scp_project_ans.deal_change_restr_txt; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.deal_change_restr_txt IS 'Изменения по реструктуризации (ручной ввод)';


--
-- Name: COLUMN scp_project_ans.scp_type_restruct_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.scp_type_restruct_id IS 'Тип реструктуризации';


--
-- Name: COLUMN scp_project_ans.min_decis_level_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.min_decis_level_id IS 'Минимальный уровень принятия решения';


--
-- Name: COLUMN scp_project_ans.modif_num_deals; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.modif_num_deals IS 'Номера договоров';


--
-- Name: COLUMN scp_project_ans.scp_matrix_type; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.scp_matrix_type IS 'Тип матрицы';


--
-- Name: COLUMN scp_project_ans.is_need_agr_cd_co; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.is_need_agr_cd_co IS 'Требуется согласование ДК ГО';


--
-- Name: COLUMN scp_project_ans.state_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.state_id IS 'Состояние';


--
-- Name: COLUMN scp_project_ans.is_old_visual_needed; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.is_old_visual_needed IS 'Нужно отобразить сокращенный визуал МРИ';


--
-- Name: COLUMN scp_project_ans.change_initiator_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.change_initiator_id IS 'Инициатор изменений';


--
-- Name: COLUMN scp_project_ans.scp_is_individual; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.scp_is_individual IS 'Индивидуальные ценовые условия';


--
-- Name: COLUMN scp_project_ans.lidm_cur_limit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.lidm_cur_limit IS 'Текущий лимит кредитования по ГСЛ в рамках продукта "Покрытая банковская гарантия", а также покрытые банковские гарантии, утвержденные до 01.09.2024 года на ЛСПР';


--
-- Name: COLUMN scp_project_ans.lidm_cur_limit_new; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.lidm_cur_limit_new IS 'Текущий лимит кредитования по ГСЛ в рамках продукта "Покрытая банковская гарантия" (в валюте утверждаемого продукта) а также покрытые банковские гарантии, утвержденные до 01.09.2024 года на ЛСПР с учетом нового лимита';


--
-- Name: COLUMN scp_project_ans.scp_bg_owner_lidm; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.scp_bg_owner_lidm IS 'Владелец ЛСПР';


--
-- Name: COLUMN scp_project_ans.scp_chief_ca_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.scp_chief_ca_id IS 'Руководитель КА';


--
-- Name: COLUMN scp_project_ans.total_looped_sum; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.total_looped_sum IS 'Сумма лимитов с учетом закольцованности лимитов';


--
-- Name: COLUMN scp_project_ans.gsl_compare_txt; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.gsl_compare_txt IS 'Состав ГСЛ (для сравнения)';


--
-- Name: COLUMN scp_project_ans.limit_confirm_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.limit_confirm_str IS 'Подтверждение лимита (строка)';


--
-- Name: COLUMN scp_project_ans.proj_city_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.proj_city_str IS 'Город';


--
-- Name: COLUMN scp_project_ans.is_primary_preparation; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.is_primary_preparation IS 'Первичная подготовка ПР завершена';


--
-- Name: COLUMN scp_project_ans.req_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.req_type_id IS 'Класс заявки';


--
-- Name: COLUMN scp_project_ans.is_cov_bank_garant; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.is_cov_bank_garant IS 'Покрытая Банковская гарантия';


--
-- Name: COLUMN scp_project_ans.memo_deal_log; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.memo_deal_log IS 'Финансирование деятельности в НС';


--
-- Name: COLUMN scp_project_ans.ns_deal_cond_log; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.ns_deal_cond_log IS 'Более 50% и территориальная приближенность активов и (или) логистических путей Клиента (ГСЛ) составляет менее 50 км от ЛБС';


--
-- Name: COLUMN scp_project_ans.confirm_cred_limit_log; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.confirm_cred_limit_log IS 'Подтвердить лимит кредитования';


--
-- Name: COLUMN scp_project_ans.confirm_csd_log; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.confirm_csd_log IS 'Внести изменения в условия кредитования и привести кредитно-обеспечительную документацию';


--
-- Name: COLUMN scp_project_ans.limit_due_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.limit_due_date IS 'Срок лимита';


--
-- Name: COLUMN scp_project_ans.limit_review_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.limit_review_date IS 'Дата пересмотра';


--
-- Name: COLUMN scp_project_ans.credit_group_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.credit_group_id IS 'Группа кредитоспособности';


--
-- Name: COLUMN scp_project_ans.raroc_roe; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.raroc_roe IS 'Прогнозный ROE';


--
-- Name: COLUMN scp_project_ans.weighted_margin; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.weighted_margin IS 'Средневзвешенная маржа';


--
-- Name: COLUMN scp_project_ans.raroc_perc; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.raroc_perc IS 'Прогнозный RAROC с учетом кросс-продаж';


--
-- Name: COLUMN scp_project_ans.is_risk_consideration; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_project_ans.is_risk_consideration IS 'Отправлен на риски/голосование';


--
-- Name: scp_sec_check_res; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.scp_sec_check_res (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    expertise_obj_id bigint,
    sec_date_check timestamp(6) without time zone,
    emp_id bigint,
    tech_atr_bool smallint,
    check_completed smallint,
    is_hide_check_manual smallint,
    scp_cl_role_str character varying(2000),
    other_comment character varying(2000),
    settle_accounts_comm character varying(2000),
    family_status_comm character varying(2000),
    credit_history_comm character varying(2000),
    affil_client_str character varying(2000),
    aspr_link_zone_id bigint,
    aspr_zone_id bigint,
    aspr_affil_res_id bigint,
    aspr_route_id bigint,
    bch_mem_res_id bigint,
    aspr_cred_hist_comm character varying(2000),
    affil_check_comm character varying(2000),
    supp_check_res_id bigint,
    sf_family_status_comm text,
    sf_settle_accounts_comm text,
    sf_credit_history_comm text,
    sf_other_comment text,
    sf_affil_client_str text,
    sf_affil_check_comm text
);



--
-- Name: TABLE scp_sec_check_res; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.scp_sec_check_res IS 'СКП. Результаты проверок, SysObjTypeEffective{id=2501029, ident=''SCP_SEC_CHECK_RES'', name=''СКП. Результаты проверок'', 12 attributes (12 actualizing)}';


--
-- Name: COLUMN scp_sec_check_res.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.id IS 'ID';


--
-- Name: COLUMN scp_sec_check_res.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN scp_sec_check_res.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN scp_sec_check_res.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.name IS 'Name';


--
-- Name: COLUMN scp_sec_check_res.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.create_date IS 'Create date';


--
-- Name: COLUMN scp_sec_check_res.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.type_id IS 'Тип объекта';


--
-- Name: COLUMN scp_sec_check_res.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.status IS 'Status';


--
-- Name: COLUMN scp_sec_check_res.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.org_id IS 'Подразделение';


--
-- Name: COLUMN scp_sec_check_res.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.user_id IS 'Пользователь';


--
-- Name: COLUMN scp_sec_check_res.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN scp_sec_check_res.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN scp_sec_check_res.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN scp_sec_check_res.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN scp_sec_check_res.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.is_system IS 'System object';


--
-- Name: COLUMN scp_sec_check_res.expertise_obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.expertise_obj_id IS 'Участник проверки';


--
-- Name: COLUMN scp_sec_check_res.sec_date_check; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.sec_date_check IS 'Дата проверки (итоговая)';


--
-- Name: COLUMN scp_sec_check_res.emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.emp_id IS 'Сотрудник СЭБ';


--
-- Name: COLUMN scp_sec_check_res.tech_atr_bool; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.tech_atr_bool IS 'Тех атр. отображение подсказки';


--
-- Name: COLUMN scp_sec_check_res.check_completed; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.check_completed IS 'Проверка произведена';


--
-- Name: COLUMN scp_sec_check_res.is_hide_check_manual; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.is_hide_check_manual IS 'Скрыть ручные проверки';


--
-- Name: COLUMN scp_sec_check_res.scp_cl_role_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.scp_cl_role_str IS '_Проверяемые роли (строковый)';


--
-- Name: COLUMN scp_sec_check_res.other_comment; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.other_comment IS 'Прочее (комментарий)';


--
-- Name: COLUMN scp_sec_check_res.settle_accounts_comm; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.settle_accounts_comm IS 'Сведения о расчетных счетах (комментарий)';


--
-- Name: COLUMN scp_sec_check_res.family_status_comm; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.family_status_comm IS 'Сведения о семейном положении (комментарий)';


--
-- Name: COLUMN scp_sec_check_res.credit_history_comm; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.credit_history_comm IS 'Кредитная история (комментарий)';


--
-- Name: COLUMN scp_sec_check_res.affil_client_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.affil_client_str IS 'Список аффилированных лиц';


--
-- Name: COLUMN scp_sec_check_res.aspr_link_zone_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.aspr_link_zone_id IS 'Зона АСПР по связке';


--
-- Name: COLUMN scp_sec_check_res.aspr_zone_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.aspr_zone_id IS 'Зона по результатам АСПР';


--
-- Name: COLUMN scp_sec_check_res.aspr_affil_res_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.aspr_affil_res_id IS 'Результат проверки аффилированности';


--
-- Name: COLUMN scp_sec_check_res.aspr_route_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.aspr_route_id IS 'Маршрутизация по результатам АСПР';


--
-- Name: COLUMN scp_sec_check_res.bch_mem_res_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.bch_mem_res_id IS 'Результат проверки КИ участника';


--
-- Name: COLUMN scp_sec_check_res.aspr_cred_hist_comm; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.aspr_cred_hist_comm IS 'Комментарии к решению по КИ';


--
-- Name: COLUMN scp_sec_check_res.affil_check_comm; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.affil_check_comm IS 'Проверка аффилированности';


--
-- Name: COLUMN scp_sec_check_res.supp_check_res_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.supp_check_res_id IS 'Результат проверки поставщика';


--
-- Name: COLUMN scp_sec_check_res.sf_family_status_comm; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.sf_family_status_comm IS '(ФС) Сведения о семейном положении';


--
-- Name: COLUMN scp_sec_check_res.sf_settle_accounts_comm; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.sf_settle_accounts_comm IS '(ФС) Сведения о расчетных счетах';


--
-- Name: COLUMN scp_sec_check_res.sf_credit_history_comm; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.sf_credit_history_comm IS '(ФС) Кредитная история';


--
-- Name: COLUMN scp_sec_check_res.sf_other_comment; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.sf_other_comment IS '(ФС) Прочее';


--
-- Name: COLUMN scp_sec_check_res.sf_affil_client_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.sf_affil_client_str IS '(ФС) Список аффилированных лиц';


--
-- Name: COLUMN scp_sec_check_res.sf_affil_check_comm; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_check_res.sf_affil_check_comm IS '(ФС) Проверка аффилированности';


--
-- Name: scp_sec_expertise; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.scp_sec_expertise (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    afl_doc_num character varying(2000),
    afl_doc_data timestamp without time zone,
    afp_state_id bigint,
    emp_id bigint,
    sec_end_date timestamp(6) without time zone,
    expertise_obj_id bigint,
    risk_zone_id bigint,
    is_appeal smallint,
    is_special_inform smallint,
    sec_recall_reason character varying(2000),
    sec_date_check timestamp(6) without time zone,
    is_ses_withdrawn smallint,
    reg_resp_emp bigint,
    scp_application_id bigint,
    is_region_work smallint,
    start_sec_date timestamp(6) without time zone,
    dataminer_in_process smallint,
    sf_app_obj_id bigint,
    traf_lights_response_id bigint,
    ident character varying(2000),
    sf_exp_term_date timestamp(6) without time zone,
    end_date timestamp(6) without time zone,
    reason_revision_str character varying(2000),
    reason_restart_str character varying(2000),
    reason_cancel_str character varying(2000),
    sec_exp_copy_id bigint,
    deleg_region_id bigint,
    is_company_state_top smallint,
    app_obj_id bigint,
    ct_sec_check_res_id bigint,
    psb_office_id bigint,
    csd_expertise_obj_id bigint,
    print_form_date timestamp(6) without time zone,
    deleg_emp_id bigint
);



--
-- Name: TABLE scp_sec_expertise; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.scp_sec_expertise IS 'СКП. Экспертиза СЭБ, SysObjTypeEffective{id=2500976, ident=''SCP_SEC_EXPERTISE'', name=''СКП. Экспертиза СЭБ'', 21 attributes (21 actualizing)}';


--
-- Name: COLUMN scp_sec_expertise.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.id IS 'ID';


--
-- Name: COLUMN scp_sec_expertise.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN scp_sec_expertise.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN scp_sec_expertise.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.name IS 'Name';


--
-- Name: COLUMN scp_sec_expertise.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.create_date IS 'Create date';


--
-- Name: COLUMN scp_sec_expertise.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.type_id IS 'Тип объекта';


--
-- Name: COLUMN scp_sec_expertise.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.status IS 'Status';


--
-- Name: COLUMN scp_sec_expertise.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.org_id IS 'Подразделение';


--
-- Name: COLUMN scp_sec_expertise.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.user_id IS 'Пользователь';


--
-- Name: COLUMN scp_sec_expertise.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN scp_sec_expertise.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN scp_sec_expertise.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN scp_sec_expertise.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN scp_sec_expertise.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.is_system IS 'System object';


--
-- Name: COLUMN scp_sec_expertise.afl_doc_num; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.afl_doc_num IS 'Номер документа';


--
-- Name: COLUMN scp_sec_expertise.afl_doc_data; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.afl_doc_data IS 'Дата документа';


--
-- Name: COLUMN scp_sec_expertise.afp_state_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.afp_state_id IS 'Состояние';


--
-- Name: COLUMN scp_sec_expertise.emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.emp_id IS 'Ответственный менеджер';


--
-- Name: COLUMN scp_sec_expertise.sec_end_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.sec_end_date IS 'Срок действия экспертизы';


--
-- Name: COLUMN scp_sec_expertise.expertise_obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.expertise_obj_id IS 'Объект экспертизы';


--
-- Name: COLUMN scp_sec_expertise.risk_zone_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.risk_zone_id IS 'Зона риска';


--
-- Name: COLUMN scp_sec_expertise.is_appeal; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.is_appeal IS 'Апелляция по заявке';


--
-- Name: COLUMN scp_sec_expertise.is_special_inform; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.is_special_inform IS 'Особые сведения';


--
-- Name: COLUMN scp_sec_expertise.sec_recall_reason; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.sec_recall_reason IS 'Обоснование отзыва экспертизы СЭБ';


--
-- Name: COLUMN scp_sec_expertise.sec_date_check; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.sec_date_check IS 'Дата проверки СЭБ (итоговая)';


--
-- Name: COLUMN scp_sec_expertise.is_ses_withdrawn; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.is_ses_withdrawn IS 'КМ отозвал экспертизу';


--
-- Name: COLUMN scp_sec_expertise.reg_resp_emp; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.reg_resp_emp IS 'Ответственный РС';


--
-- Name: COLUMN scp_sec_expertise.scp_application_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.scp_application_id IS 'Заявка СКП';


--
-- Name: COLUMN scp_sec_expertise.is_region_work; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.is_region_work IS 'В работе у регионов';


--
-- Name: COLUMN scp_sec_expertise.start_sec_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.start_sec_date IS 'Дата поступления заявки в СЭБ';


--
-- Name: COLUMN scp_sec_expertise.dataminer_in_process; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.dataminer_in_process IS 'Выполняется Dataminer';


--
-- Name: COLUMN scp_sec_expertise.sf_app_obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.sf_app_obj_id IS 'Ссылка на заявку ФС';


--
-- Name: COLUMN scp_sec_expertise.traf_lights_response_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.traf_lights_response_id IS 'Результат проверки Светофор';


--
-- Name: COLUMN scp_sec_expertise.ident; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.ident IS 'Сист. Идентификатор';


--
-- Name: COLUMN scp_sec_expertise.sf_exp_term_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.sf_exp_term_date IS 'Срок действия';


--
-- Name: COLUMN scp_sec_expertise.end_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.end_date IS 'Дата завершения экспертизы';


--
-- Name: COLUMN scp_sec_expertise.reason_revision_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.reason_revision_str IS 'Причина доработки';


--
-- Name: COLUMN scp_sec_expertise.reason_restart_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.reason_restart_str IS 'Причина перезапуска';


--
-- Name: COLUMN scp_sec_expertise.reason_cancel_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.reason_cancel_str IS 'Причина отмены';


--
-- Name: COLUMN scp_sec_expertise.sec_exp_copy_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.sec_exp_copy_id IS 'Ссылка на копируемую экспертизу';


--
-- Name: COLUMN scp_sec_expertise.deleg_region_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.deleg_region_id IS 'Регион назначения';


--
-- Name: COLUMN scp_sec_expertise.is_company_state_top; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.is_company_state_top IS 'Госкомпания/ТОП-600';


--
-- Name: COLUMN scp_sec_expertise.app_obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.app_obj_id IS 'Ссылка на заявку КТ';


--
-- Name: COLUMN scp_sec_expertise.ct_sec_check_res_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.ct_sec_check_res_id IS 'Результаты проверки (КТ)';


--
-- Name: COLUMN scp_sec_expertise.psb_office_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.psb_office_id IS 'Офис делегирования';


--
-- Name: COLUMN scp_sec_expertise.csd_expertise_obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.csd_expertise_obj_id IS 'Объект экспертизы (КОД)';


--
-- Name: COLUMN scp_sec_expertise.print_form_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.print_form_date IS 'Дата СЭБ для вывода в ПФ';


--
-- Name: COLUMN scp_sec_expertise.deleg_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_sec_expertise.deleg_emp_id IS 'Сотрудник для делегирования';


--
-- Name: scp_techcred; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.scp_techcred (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    ord bigint,
    ident character varying(2000),
    name__en character varying(2000)
);



--
-- Name: TABLE scp_techcred; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.scp_techcred IS 'СКП. Справочники: технология кредитования, SysObjTypeEffective{id=2230400, ident=''SCP_TECHCRED'', name=''СКП. Справочники: технология кредитования'', 13 attributes (13 actualizing)}';


--
-- Name: COLUMN scp_techcred.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_techcred.id IS 'ID';


--
-- Name: COLUMN scp_techcred.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_techcred.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN scp_techcred.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_techcred.name IS 'Name';


--
-- Name: COLUMN scp_techcred.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_techcred.create_date IS 'Create date';


--
-- Name: COLUMN scp_techcred.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_techcred.type_id IS 'Тип объекта';


--
-- Name: COLUMN scp_techcred.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_techcred.status IS 'Status';


--
-- Name: COLUMN scp_techcred.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_techcred.org_id IS 'Подразделение';


--
-- Name: COLUMN scp_techcred.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_techcred.user_id IS 'Пользователь';


--
-- Name: COLUMN scp_techcred.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_techcred.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN scp_techcred.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_techcred.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN scp_techcred.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_techcred.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN scp_techcred.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_techcred.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN scp_techcred.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_techcred.is_system IS 'System object';


--
-- Name: COLUMN scp_techcred.ord; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_techcred.ord IS 'Порядок';


--
-- Name: COLUMN scp_techcred.ident; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_techcred.ident IS 'Идентификатор';


--
-- Name: COLUMN scp_techcred.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.scp_techcred.name__en IS 'Name, languageSchema=en';


--
-- Name: sys_algorithm; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.sys_algorithm (
    id bigint NOT NULL,
    name__en character varying(2000),
    name__ru character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone NOT NULL,
    type_id bigint NOT NULL,
    status smallint NOT NULL,
    org_id bigint NOT NULL,
    user_id bigint NOT NULL,
    amy_ident character varying(2000) NOT NULL,
    amy_frml_text text,
    amy_alg_type_id bigint NOT NULL,
    amy_base_type_id bigint,
    amy_sys_alg_not_replace_null smallint,
    amy_compiled_code text,
    created_emp_id bigint NOT NULL,
    last_modified_user_id bigint NOT NULL,
    last_modified_emp_id bigint NOT NULL,
    last_modified_date timestamp without time zone NOT NULL,
    is_system smallint,
    amy_ver_num bigint,
    amy_alg_name character varying(2000),
    amy_use_null_if_src_empty smallint
);



--
-- Name: TABLE sys_algorithm; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.sys_algorithm IS 'РМ. Алгоритм, SysObjectType{id=118404, name=''РМ. Алгоритм'', ident=''RISK_ALGORITHM''}';


--
-- Name: COLUMN sys_algorithm.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_algorithm.id IS 'Код, SysTypeAttrEffective{} AbstractAttrEffective{id=101002, ident=''ID''}';


--
-- Name: COLUMN sys_algorithm.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_algorithm.name__en IS 'Наименование версии, languageSchema=en';


--
-- Name: COLUMN sys_algorithm.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_algorithm.name__ru IS 'Наименование версии, languageSchema=ru';


--
-- Name: COLUMN sys_algorithm.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_algorithm.name IS 'Наименование версии';


--
-- Name: COLUMN sys_algorithm.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_algorithm.create_date IS 'Дата создания';


--
-- Name: COLUMN sys_algorithm.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_algorithm.type_id IS 'Тип объекта';


--
-- Name: COLUMN sys_algorithm.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_algorithm.status IS 'Статус';


--
-- Name: COLUMN sys_algorithm.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_algorithm.org_id IS 'Подразделение';


--
-- Name: COLUMN sys_algorithm.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_algorithm.user_id IS 'Пользователь';


--
-- Name: COLUMN sys_algorithm.amy_ident; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_algorithm.amy_ident IS 'Сист. Идентификатор';


--
-- Name: COLUMN sys_algorithm.amy_frml_text; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_algorithm.amy_frml_text IS 'Формула';


--
-- Name: COLUMN sys_algorithm.amy_alg_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_algorithm.amy_alg_type_id IS 'Тип алгоритма';


--
-- Name: COLUMN sys_algorithm.amy_base_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_algorithm.amy_base_type_id IS 'Базовый тип объектов';


--
-- Name: COLUMN sys_algorithm.amy_sys_alg_not_replace_null; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_algorithm.amy_sys_alg_not_replace_null IS 'Не заменять null на 0';


--
-- Name: COLUMN sys_algorithm.amy_compiled_code; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_algorithm.amy_compiled_code IS 'Скомпилированный код';


--
-- Name: COLUMN sys_algorithm.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_algorithm.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN sys_algorithm.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_algorithm.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN sys_algorithm.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_algorithm.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN sys_algorithm.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_algorithm.last_modified_date IS 'Дата последнего изменения';


--
-- Name: COLUMN sys_algorithm.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_algorithm.is_system IS 'Системный объект';


--
-- Name: COLUMN sys_algorithm.amy_ver_num; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_algorithm.amy_ver_num IS 'Номер версии';


--
-- Name: COLUMN sys_algorithm.amy_alg_name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_algorithm.amy_alg_name IS 'Наименование алгоритма';


--
-- Name: COLUMN sys_algorithm.amy_use_null_if_src_empty; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_algorithm.amy_use_null_if_src_empty IS 'Вернуть null, если все исходные данные пустые';


--
-- Name: sys_employee; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.sys_employee (
    id bigint NOT NULL,
    name character varying(2000) NOT NULL,
    type_id bigint NOT NULL,
    org_id bigint NOT NULL,
    status smallint NOT NULL,
    create_date timestamp without time zone NOT NULL,
    user_id bigint NOT NULL,
    emp_org_id bigint NOT NULL,
    name__en character varying(2000),
    name__ru character varying(2000),
    first_name character varying(2000),
    second_name character varying(2000),
    sur_name character varying(2000),
    job_pos_id bigint,
    email character varying(2000),
    birthday timestamp without time zone,
    phone character varying(100),
    skype character varying(1024),
    created_emp_id bigint NOT NULL,
    last_modified_user_id bigint NOT NULL,
    last_modified_emp_id bigint NOT NULL,
    last_modified_date timestamp without time zone NOT NULL,
    is_system smallint,
    time_zone bigint,
    sys_image bigint,
    is_locked smallint,
    workday_schedule_id bigint,
    email_confirmed smallint,
    phone_confirmed smallint,
    ban_send_notifications smallint,
    city_id bigint,
    sex_id bigint,
    locale_id bigint,
    sur_name__ru character varying(2000),
    sur_name__en character varying(2000),
    first_name__ru character varying(2000),
    first_name__en character varying(2000),
    second_name__ru character varying(2000),
    second_name__en character varying(2000),
    ps_office bigint,
    adress_ad character varying(2000),
    pers_emp_number character varying(2000),
    inner_emp_phone character varying(2000),
    pers_opt_dmm_link bigint
);



--
-- Name: TABLE sys_employee; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.sys_employee IS 'Сотрудник';


--
-- Name: COLUMN sys_employee.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.id IS 'Код, SysTypeAttrEffective{} AbstractAttrEffective{id=101002, ident=''ID''}';


--
-- Name: COLUMN sys_employee.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.name IS 'Name';


--
-- Name: COLUMN sys_employee.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.type_id IS 'Тип объекта';


--
-- Name: COLUMN sys_employee.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.org_id IS 'Подразделение';


--
-- Name: COLUMN sys_employee.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.status IS 'Status';


--
-- Name: COLUMN sys_employee.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.create_date IS 'Create date';


--
-- Name: COLUMN sys_employee.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.user_id IS 'Пользователь';


--
-- Name: COLUMN sys_employee.emp_org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.emp_org_id IS 'Office of the employee';


--
-- Name: COLUMN sys_employee.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN sys_employee.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN sys_employee.first_name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.first_name IS 'Name';


--
-- Name: COLUMN sys_employee.second_name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.second_name IS 'Middle name';


--
-- Name: COLUMN sys_employee.sur_name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.sur_name IS 'Family name';


--
-- Name: COLUMN sys_employee.job_pos_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.job_pos_id IS 'Position';


--
-- Name: COLUMN sys_employee.email; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.email IS 'E-MAIL';


--
-- Name: COLUMN sys_employee.birthday; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.birthday IS 'Birthday';


--
-- Name: COLUMN sys_employee.phone; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.phone IS 'Phone';


--
-- Name: COLUMN sys_employee.skype; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.skype IS 'Skype';


--
-- Name: COLUMN sys_employee.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN sys_employee.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN sys_employee.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN sys_employee.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN sys_employee.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.is_system IS 'System object';


--
-- Name: COLUMN sys_employee.time_zone; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.time_zone IS 'Time zone';


--
-- Name: COLUMN sys_employee.sys_image; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.sys_image IS 'Photo';


--
-- Name: COLUMN sys_employee.is_locked; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.is_locked IS 'Lock a staff member';


--
-- Name: COLUMN sys_employee.workday_schedule_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.workday_schedule_id IS 'Working hours';


--
-- Name: COLUMN sys_employee.email_confirmed; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.email_confirmed IS 'EMAIL confirmed';


--
-- Name: COLUMN sys_employee.phone_confirmed; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.phone_confirmed IS 'Phone number confirmed';


--
-- Name: COLUMN sys_employee.ban_send_notifications; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.ban_send_notifications IS 'Do not send notifications to email';


--
-- Name: COLUMN sys_employee.city_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.city_id IS 'Locality';


--
-- Name: COLUMN sys_employee.sex_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.sex_id IS 'Sex';


--
-- Name: COLUMN sys_employee.locale_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.locale_id IS 'Locale';


--
-- Name: COLUMN sys_employee.sur_name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.sur_name__ru IS 'Family name, languageSchema=ru';


--
-- Name: COLUMN sys_employee.sur_name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.sur_name__en IS 'Family name, languageSchema=en';


--
-- Name: COLUMN sys_employee.first_name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.first_name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN sys_employee.first_name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.first_name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN sys_employee.second_name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.second_name__ru IS 'Middle name, languageSchema=ru';


--
-- Name: COLUMN sys_employee.second_name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.second_name__en IS 'Middle name, languageSchema=en';


--
-- Name: COLUMN sys_employee.ps_office; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.ps_office IS 'ОФИС ПСБ';


--
-- Name: COLUMN sys_employee.adress_ad; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.adress_ad IS 'Расположение объекта в AD';


--
-- Name: COLUMN sys_employee.pers_emp_number; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.pers_emp_number IS 'Табельный номер сотрудника';


--
-- Name: COLUMN sys_employee.inner_emp_phone; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.inner_emp_phone IS 'Внутренний номер сотрудника';


--
-- Name: COLUMN sys_employee.pers_opt_dmm_link; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_employee.pers_opt_dmm_link IS 'Персональная настройка модуля обновлений';


--
-- Name: sys_company; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.sys_company (
    id bigint NOT NULL,
    name character varying(2000) NOT NULL,
    short_name character varying(2000),
    inn character varying(20),
    type_id bigint NOT NULL,
    org_id bigint NOT NULL,
    status smallint NOT NULL,
    create_date timestamp without time zone NOT NULL,
    user_id bigint NOT NULL,
    name__en character varying(2000),
    name__ru character varying(2000),
    attr_email character varying(2000),
    attr_web_site character varying(2000),
    created_emp_id bigint NOT NULL,
    last_modified_user_id bigint NOT NULL,
    last_modified_emp_id bigint NOT NULL,
    last_modified_date timestamp without time zone NOT NULL,
    is_system smallint,
    attr_reg_country character varying(2000),
    contact_phone character varying(2000),
    main_okved bigint,
    business_segment bigint,
    comp_reg_date timestamp(6) without time zone,
    group_company_link bigint,
    company_record_date timestamp(6) without time zone,
    company_registrator character varying(2000),
    company_tax_authority character varying(2000),
    crmd_client_id character varying(2000),
    act_addr_city character varying(2000),
    act_addr_street character varying(2000),
    reg_addr_street character varying(2000),
    reg_addr_city character varying(2000),
    attr_attr_abs character varying(2000),
    tax_authority_reg character varying(2000),
    tax_authority_account character varying(2000),
    customer_type_id bigint,
    sign_of_sme smallint,
    date_of_registration timestamp(6) without time zone,
    newly_founded smallint,
    offices_psb_id bigint,
    sign_of_bankruptcy smallint,
    stage_of_bankruptcy bigint,
    granting_consent smallint,
    date_of_consent timestamp(6) without time zone,
    fo_okved bigint,
    busines_segment_id bigint,
    d_storage_balance_txt character varying(2000),
    d_storage_finrep_txt character varying(2000),
    is_rko smallint,
    afina_segment_id bigint,
    neg_comment character varying(2000),
    neg_status smallint,
    attr_launch_neg_etl smallint
);



--
-- Name: TABLE sys_company; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.sys_company IS 'Компания/контрагент';


--
-- Name: COLUMN sys_company.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.id IS 'Код, SysTypeAttrEffective{id=101002, ident=''ID''}';


--
-- Name: COLUMN sys_company.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.name IS 'Name';


--
-- Name: COLUMN sys_company.short_name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.short_name IS 'Short name';


--
-- Name: COLUMN sys_company.inn; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.inn IS 'TIN';


--
-- Name: COLUMN sys_company.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.type_id IS 'Тип объекта';


--
-- Name: COLUMN sys_company.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.org_id IS 'Подразделение';


--
-- Name: COLUMN sys_company.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.status IS 'Status';


--
-- Name: COLUMN sys_company.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.create_date IS 'Create date';


--
-- Name: COLUMN sys_company.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.user_id IS 'Пользователь';


--
-- Name: COLUMN sys_company.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN sys_company.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN sys_company.attr_email; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.attr_email IS 'Email';


--
-- Name: COLUMN sys_company.attr_web_site; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.attr_web_site IS 'Website';


--
-- Name: COLUMN sys_company.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN sys_company.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN sys_company.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN sys_company.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN sys_company.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.is_system IS 'System object';


--
-- Name: COLUMN sys_company.attr_reg_country; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.attr_reg_country IS 'Адрес регистрации: страна';


--
-- Name: COLUMN sys_company.contact_phone; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.contact_phone IS 'Phone';


--
-- Name: COLUMN sys_company.main_okved; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.main_okved IS 'Basic OKVED code';


--
-- Name: COLUMN sys_company.business_segment; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.business_segment IS 'Business segment';


--
-- Name: COLUMN sys_company.comp_reg_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.comp_reg_date IS 'Registration date';


--
-- Name: COLUMN sys_company.group_company_link; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.group_company_link IS 'Group of companies';


--
-- Name: COLUMN sys_company.company_record_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.company_record_date IS 'Tax registration date';


--
-- Name: COLUMN sys_company.company_registrator; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.company_registrator IS 'Registrar';


--
-- Name: COLUMN sys_company.company_tax_authority; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.company_tax_authority IS 'Tax authority';


--
-- Name: COLUMN sys_company.crmd_client_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.crmd_client_id IS 'Код контрагента CRMD';


--
-- Name: COLUMN sys_company.act_addr_city; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.act_addr_city IS 'Фактический адрес: город';


--
-- Name: COLUMN sys_company.act_addr_street; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.act_addr_street IS 'Фактический адрес: улица';


--
-- Name: COLUMN sys_company.reg_addr_street; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.reg_addr_street IS 'Адрес регистрации: улица';


--
-- Name: COLUMN sys_company.reg_addr_city; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.reg_addr_city IS 'Адрес регистрации: город';


--
-- Name: COLUMN sys_company.attr_attr_abs; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.attr_attr_abs IS 'Идентификатор АБС';


--
-- Name: COLUMN sys_company.tax_authority_reg; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.tax_authority_reg IS 'Налоговый орган, в котором лицо зарегистрировано';


--
-- Name: COLUMN sys_company.tax_authority_account; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.tax_authority_account IS 'Налоговый орган, в котором лицо состоит на учёте';


--
-- Name: COLUMN sys_company.customer_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.customer_type_id IS 'Тип клиента';


--
-- Name: COLUMN sys_company.sign_of_sme; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.sign_of_sme IS 'Признак МСП';


--
-- Name: COLUMN sys_company.date_of_registration; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.date_of_registration IS '_Дата регистрации ЕГРЮЛ';


--
-- Name: COLUMN sys_company.newly_founded; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.newly_founded IS 'Вновь созданное?';


--
-- Name: COLUMN sys_company.offices_psb_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.offices_psb_id IS 'Офисы';


--
-- Name: COLUMN sys_company.sign_of_bankruptcy; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.sign_of_bankruptcy IS 'Признак банкротства';


--
-- Name: COLUMN sys_company.stage_of_bankruptcy; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.stage_of_bankruptcy IS 'Стадия банкротства';


--
-- Name: COLUMN sys_company.granting_consent; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.granting_consent IS 'Согласие предоставлено';


--
-- Name: COLUMN sys_company.date_of_consent; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.date_of_consent IS 'Дата согласия';


--
-- Name: COLUMN sys_company.fo_okved; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.fo_okved IS 'ОКВЭД из отчётности';


--
-- Name: COLUMN sys_company.busines_segment_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.busines_segment_id IS 'Сегмент по размеру бизнеса';


--
-- Name: COLUMN sys_company.d_storage_balance_txt; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.d_storage_balance_txt IS 'Атрибут для хранения дат (виджет баланса)';


--
-- Name: COLUMN sys_company.d_storage_finrep_txt; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.d_storage_finrep_txt IS 'Атрибут для хранения дат (виджет ОФР)';


--
-- Name: COLUMN sys_company.is_rko; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.is_rko IS 'Наличие открытого расчетного счета';


--
-- Name: COLUMN sys_company.afina_segment_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.afina_segment_id IS 'Сегмент по размеру бизнеса (Н. Афина)';


--
-- Name: COLUMN sys_company.neg_comment; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.neg_comment IS 'Комментарий к признаку негатива';


--
-- Name: COLUMN sys_company.neg_status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.neg_status IS 'Статус признака негатива';


--
-- Name: COLUMN sys_company.attr_launch_neg_etl; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_company.attr_launch_neg_etl IS 'Признак запуска интеграции по негативу';


--
-- Name: sys_obj_resp; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.sys_obj_resp (
    id bigint NOT NULL,
    name__en character varying(2000),
    name__ru character varying(2000),
    name character varying(2000) NOT NULL,
    create_date timestamp without time zone NOT NULL,
    type_id bigint NOT NULL,
    status smallint NOT NULL,
    org_id bigint NOT NULL,
    user_id bigint NOT NULL,
    afe_emp_id bigint NOT NULL,
    afe_obj_id bigint NOT NULL,
    afe_subject_id bigint NOT NULL,
    created_emp_id bigint NOT NULL,
    last_modified_user_id bigint NOT NULL,
    last_modified_emp_id bigint NOT NULL,
    last_modified_date timestamp without time zone NOT NULL,
    is_system smallint,
    afe_ext_obj_id bigint,
    afe_resp_comment text,
    afe_short_name character varying(2000),
    afe_start_stamp timestamp without time zone,
    afe_end_stamp timestamp without time zone,
    afe_current_resp bigint,
    afe_manage_emp bigint
);



--
-- Name: TABLE sys_obj_resp; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.sys_obj_resp IS 'Ответственные сотрудники, SysObjectType{id=105164, name=''Ответственные сотрудники'', ident=''SYS_OBJ_RESP''}';


--
-- Name: COLUMN sys_obj_resp.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_resp.id IS 'Сист. Код, SysAttribute{id=''10000'', name=''Сист. Код'', ident=''ID'', isTimeDepended=''false''}';


--
-- Name: COLUMN sys_obj_resp.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_resp.name__en IS 'Сист. Наименование, SysAttribute{id=''10001'', name=''Сист. Наименование'', ident=''NAME'', isTimeDepended=''false''}, languageSchema=en';


--
-- Name: COLUMN sys_obj_resp.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_resp.name__ru IS 'Сист. Наименование, SysAttribute{id=''10001'', name=''Сист. Наименование'', ident=''NAME'', isTimeDepended=''false''}, languageSchema=ru';


--
-- Name: COLUMN sys_obj_resp.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_resp.name IS 'Сист. Наименование, SysAttribute{id=''10001'', name=''Сист. Наименование'', ident=''NAME'', isTimeDepended=''false''}';


--
-- Name: COLUMN sys_obj_resp.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_resp.create_date IS 'Сист. Дата создания, SysAttribute{id=''10002'', name=''Сист. Дата создания'', ident=''CREATE_DATE'', isTimeDepended=''false''}';


--
-- Name: COLUMN sys_obj_resp.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_resp.type_id IS 'Сист. Тип объекта, SysAttribute{id=''10003'', name=''Сист. Тип объекта'', ident=''TYPE_ID'', isTimeDepended=''false''}';


--
-- Name: COLUMN sys_obj_resp.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_resp.status IS 'Сист. Статус, SysAttribute{id=''10004'', name=''Сист. Статус'', ident=''STATUS'', isTimeDepended=''false''}';


--
-- Name: COLUMN sys_obj_resp.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_resp.org_id IS 'Сист. Подразделение, SysAttribute{id=''10005'', name=''Сист. Подразделение'', ident=''ORG_ID'', isTimeDepended=''false''}';


--
-- Name: COLUMN sys_obj_resp.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_resp.user_id IS 'Сист. Пользователь, SysAttribute{id=''10006'', name=''Сист. Пользователь'', ident=''USER_ID'', isTimeDepended=''false''}';


--
-- Name: COLUMN sys_obj_resp.afe_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_resp.afe_emp_id IS 'Сист. Сотрудник, SysAttribute{id=''10017'', name=''Сист. Сотрудник'', ident=''EMP_ID'', isTimeDepended=''false''}';


--
-- Name: COLUMN sys_obj_resp.afe_obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_resp.afe_obj_id IS 'Объект мониторинга, SysAttribute{id=''103836'', name=''Объект мониторинга'', ident=''OBJ_ID'', isTimeDepended=''false''}';


--
-- Name: COLUMN sys_obj_resp.afe_subject_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_resp.afe_subject_id IS 'Сист. Субъект безопасности, SysAttribute{id=''108531'', name=''Сист. Субъект безопасности'', ident=''SUBJECT_ID'', isTimeDepended=''false''}';


--
-- Name: COLUMN sys_obj_resp.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_resp.created_emp_id IS 'Сист. Сотрудник, создавший объект, SysAttribute{id=''10039'', name=''Сист. Сотрудник, создавший объект'', ident=''CREATED_EMP_ID'', isTimeDepended=''false''}';


--
-- Name: COLUMN sys_obj_resp.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_resp.last_modified_user_id IS 'Сист. Пользователь, кто последним изменил, SysAttribute{id=''10038'', name=''Сист. Пользователь, кто последним изменил'', ident=''LAST_MODIFIED_USER_ID'', isTimeDepended=''false''}';


--
-- Name: COLUMN sys_obj_resp.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_resp.last_modified_emp_id IS 'Сист. Сотрудник, кто последним изменил, SysAttribute{id=''10040'', name=''Сист. Сотрудник, кто последним изменил'', ident=''LAST_MODIFIED_EMP_ID'', isTimeDepended=''false''}';


--
-- Name: COLUMN sys_obj_resp.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_resp.last_modified_date IS 'Сист. Дата последнего изменения, SysAttribute{id=''10037'', name=''Сист. Дата последнего изменения'', ident=''LAST_MODIFIED_DATE'', isTimeDepended=''false''}';


--
-- Name: COLUMN sys_obj_resp.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_resp.is_system IS 'Сист. Системный объект, SysAttribute{id=''10016'', name=''Сист. Системный объект'', ident=''SYS_OBJ_TYPE_IS_SYSTEM'', isTimeDepended=''false''}';


--
-- Name: COLUMN sys_obj_resp.afe_ext_obj_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_resp.afe_ext_obj_id IS 'Дополнительный объект, SysAttribute{id=''237411'', name=''Дополнительный объект'', ident=''EXT_OBJ_ID''}';


--
-- Name: COLUMN sys_obj_resp.afe_resp_comment; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_resp.afe_resp_comment IS 'Комментарий, SysAttribute{id=''586710'', name=''Комментарий'', ident=''RESP_COMMENT''}';


--
-- Name: COLUMN sys_obj_resp.afe_short_name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_obj_resp.afe_short_name IS 'Краткое наименование, SysAttribute{id=''108398'', name=''Краткое наименование'', ident=''ORG_STR_SHORT_NAME''}';


--
-- Name: sys_state; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.sys_state (
    id bigint NOT NULL,
    name character varying(2000) NOT NULL,
    create_date timestamp without time zone NOT NULL,
    type_id bigint NOT NULL,
    status smallint NOT NULL,
    org_id bigint NOT NULL,
    user_id bigint NOT NULL,
    afr_ident character varying(2000) NOT NULL,
    afr_ord bigint NOT NULL,
    afr_note character varying(2000),
    name__ru character varying(2000),
    name__en character varying(2000),
    created_emp_id bigint NOT NULL,
    last_modified_user_id bigint NOT NULL,
    last_modified_emp_id bigint NOT NULL,
    last_modified_date timestamp without time zone NOT NULL,
    is_system smallint
);



--
-- Name: TABLE sys_state; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.sys_state IS 'Состояние объекта, SysObjectType{id=105230, name=''Состояние объекта'', ident=''SYS_STATE''}';


--
-- Name: COLUMN sys_state.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_state.id IS 'Сист. Код, SysAttribute{id=''10000'', name=''Сист. Код'', ident=''ID'', isTimeDepended=''false''}';


--
-- Name: COLUMN sys_state.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_state.name IS 'Name';


--
-- Name: COLUMN sys_state.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_state.create_date IS 'Create date';


--
-- Name: COLUMN sys_state.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_state.type_id IS 'Тип объекта';


--
-- Name: COLUMN sys_state.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_state.status IS 'Status';


--
-- Name: COLUMN sys_state.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_state.org_id IS 'Подразделение';


--
-- Name: COLUMN sys_state.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_state.user_id IS 'Пользователь';


--
-- Name: COLUMN sys_state.afr_ident; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_state.afr_ident IS 'Identifier';


--
-- Name: COLUMN sys_state.afr_ord; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_state.afr_ord IS 'Order';


--
-- Name: COLUMN sys_state.afr_note; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_state.afr_note IS 'Description';


--
-- Name: COLUMN sys_state.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_state.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN sys_state.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_state.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN sys_state.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_state.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN sys_state.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_state.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN sys_state.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_state.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN sys_state.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_state.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN sys_state.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.sys_state.is_system IS 'System object';


--
-- Name: tbs_type; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.tbs_type (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    ord bigint,
    identif character varying(2000),
    acc_subconto_type_id bigint,
    name__en character varying(2000)
);



--
-- Name: TABLE tbs_type; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.tbs_type IS 'Тип ОСВ, SysObjTypeEffective{id=2470230, ident=''TBS_TYPE'', name=''Тип ОСВ'', 13 attributes (13 actualizing)}';


--
-- Name: COLUMN tbs_type.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.tbs_type.id IS 'ID';


--
-- Name: COLUMN tbs_type.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.tbs_type.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN tbs_type.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.tbs_type.name IS 'Name';


--
-- Name: COLUMN tbs_type.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.tbs_type.create_date IS 'Create date';


--
-- Name: COLUMN tbs_type.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.tbs_type.type_id IS 'Тип объекта';


--
-- Name: COLUMN tbs_type.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.tbs_type.status IS 'Status';


--
-- Name: COLUMN tbs_type.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.tbs_type.org_id IS 'Подразделение';


--
-- Name: COLUMN tbs_type.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.tbs_type.user_id IS 'Пользователь';


--
-- Name: COLUMN tbs_type.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.tbs_type.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN tbs_type.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.tbs_type.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN tbs_type.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.tbs_type.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN tbs_type.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.tbs_type.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN tbs_type.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.tbs_type.is_system IS 'System object';


--
-- Name: COLUMN tbs_type.ord; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.tbs_type.ord IS 'Порядок';


--
-- Name: COLUMN tbs_type.identif; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.tbs_type.identif IS 'Идентификатор';


--
-- Name: COLUMN tbs_type.acc_subconto_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.tbs_type.acc_subconto_type_id IS 'Сокращенное название';


--
-- Name: COLUMN tbs_type.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.tbs_type.name__en IS 'Name, languageSchema=en';


--
-- Name: type_loan; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.type_loan (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    prod_type_upp_lev_id bigint,
    ord bigint,
    ident character varying(2000),
    rel_submis_form smallint,
    seq_prod_number bigint,
    name__en character varying(2000)
);



--
-- Name: TABLE type_loan; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.type_loan IS 'Справочник: вид кредита, SysObjTypeEffective{id=842496, ident=''TYPE_LOAN'', name=''Справочник: вид кредита'', 16 attributes (16 actualizing)}';


--
-- Name: COLUMN type_loan.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.type_loan.id IS 'ID';


--
-- Name: COLUMN type_loan.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.type_loan.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN type_loan.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.type_loan.name IS 'Name';


--
-- Name: COLUMN type_loan.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.type_loan.create_date IS 'Create date';


--
-- Name: COLUMN type_loan.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.type_loan.type_id IS 'Тип объекта';


--
-- Name: COLUMN type_loan.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.type_loan.status IS 'Status';


--
-- Name: COLUMN type_loan.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.type_loan.org_id IS 'Подразделение';


--
-- Name: COLUMN type_loan.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.type_loan.user_id IS 'Пользователь';


--
-- Name: COLUMN type_loan.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.type_loan.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN type_loan.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.type_loan.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN type_loan.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.type_loan.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN type_loan.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.type_loan.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN type_loan.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.type_loan.is_system IS 'System object';


--
-- Name: COLUMN type_loan.prod_type_upp_lev_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.type_loan.prod_type_upp_lev_id IS 'Не использовать! Форма продукта_верхнеуровневая';


--
-- Name: COLUMN type_loan.ord; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.type_loan.ord IS 'Порядок';


--
-- Name: COLUMN type_loan.ident; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.type_loan.ident IS 'Сист. Идентификатор';


--
-- Name: COLUMN type_loan.rel_submis_form; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.type_loan.rel_submis_form IS 'Актуальность формы предоставления';


--
-- Name: COLUMN type_loan.seq_prod_number; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.type_loan.seq_prod_number IS 'Порядковый номер (для нумерации субпродуктов)';


--
-- Name: COLUMN type_loan.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.type_loan.name__en IS 'Name, languageSchema=en';


--
-- Name: yaig_client_gen_agr; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.yaig_client_gen_agr (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    yaig_client_princip_id bigint,
    yaig_gen_agr_id bigint,
    yaig_gen_agr_sum numeric,
    yaig_date_close timestamp(6) without time zone,
    yaig_date_open timestamp(6) without time zone,
    yaig_gen_agr_num character varying(2000),
    yaig_unused_limit numeric,
    yaig_gen_agr_type_id bigint,
    yaig_cur_id bigint,
    yaig_client_link bigint,
    yaig_base_code bigint
);



--
-- Name: TABLE yaig_client_gen_agr; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.yaig_client_gen_agr IS 'УАиГ. Генеральное соглашение клиента, SysObjTypeEffective{id=3892335, ident=''YAIG_CLIENT_GEN_AGR'', name=''УАиГ. Генеральное соглашение клиента'', 12 attributes (12 actualizing)}';


--
-- Name: COLUMN yaig_client_gen_agr.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_gen_agr.id IS 'ID';


--
-- Name: COLUMN yaig_client_gen_agr.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_gen_agr.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN yaig_client_gen_agr.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_gen_agr.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN yaig_client_gen_agr.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_gen_agr.name IS 'Name';


--
-- Name: COLUMN yaig_client_gen_agr.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_gen_agr.create_date IS 'Create date';


--
-- Name: COLUMN yaig_client_gen_agr.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_gen_agr.type_id IS 'Тип объекта';


--
-- Name: COLUMN yaig_client_gen_agr.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_gen_agr.status IS 'Status';


--
-- Name: COLUMN yaig_client_gen_agr.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_gen_agr.org_id IS 'Подразделение';


--
-- Name: COLUMN yaig_client_gen_agr.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_gen_agr.user_id IS 'Пользователь';


--
-- Name: COLUMN yaig_client_gen_agr.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_gen_agr.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN yaig_client_gen_agr.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_gen_agr.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN yaig_client_gen_agr.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_gen_agr.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN yaig_client_gen_agr.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_gen_agr.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN yaig_client_gen_agr.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_gen_agr.is_system IS 'System object';


--
-- Name: COLUMN yaig_client_gen_agr.yaig_client_princip_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_gen_agr.yaig_client_princip_id IS 'УАиГ клиент';


--
-- Name: COLUMN yaig_client_gen_agr.yaig_gen_agr_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_gen_agr.yaig_gen_agr_id IS 'ID генерального соглашения';


--
-- Name: COLUMN yaig_client_gen_agr.yaig_gen_agr_sum; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_gen_agr.yaig_gen_agr_sum IS 'Сумма генерального соглашения';


--
-- Name: COLUMN yaig_client_gen_agr.yaig_date_close; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_gen_agr.yaig_date_close IS 'Дата истечения';


--
-- Name: COLUMN yaig_client_gen_agr.yaig_date_open; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_gen_agr.yaig_date_open IS 'Дата подписания';


--
-- Name: COLUMN yaig_client_gen_agr.yaig_gen_agr_num; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_gen_agr.yaig_gen_agr_num IS 'Номер генерального соглашения';


--
-- Name: COLUMN yaig_client_gen_agr.yaig_unused_limit; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_gen_agr.yaig_unused_limit IS 'Сумма неиспользованного лимита';


--
-- Name: COLUMN yaig_client_gen_agr.yaig_gen_agr_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_gen_agr.yaig_gen_agr_type_id IS 'Тип генерального соглашения';


--
-- Name: COLUMN yaig_client_gen_agr.yaig_cur_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_gen_agr.yaig_cur_id IS 'Валюта генерального соглашения';


--
-- Name: COLUMN yaig_client_gen_agr.yaig_client_link; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_gen_agr.yaig_client_link IS 'Ссылка на клиента';


--
-- Name: COLUMN yaig_client_gen_agr.yaig_base_code; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_gen_agr.yaig_base_code IS 'Код базы НА';


--
-- Name: yaig_client_guarantee; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.yaig_client_guarantee (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    yaig_client_princip_id bigint,
    yaig_product_id bigint,
    yaig_guar_summ numeric,
    yaig_manager_name character varying(2000),
    yaig_risk_group bigint,
    yaig_manager_code bigint,
    yaig_quality_categ bigint,
    yaig_guar_type_id bigint,
    yaig_prnt_gen_agr_id bigint,
    yaig_cur_id bigint,
    yaig_client_link bigint,
    yaig_date_close timestamp(6) without time zone,
    yaig_date_open timestamp(6) without time zone,
    yaig_guar_num character varying(2000),
    yaig_guarantee_id bigint,
    yaig_sum_commis numeric,
    yaig_manager_code_str character varying(2000),
    yaig_guar_disclosure timestamp(6) without time zone,
    yaig_guar_payments_bool smallint,
    yaig_guar_payment bigint,
    contr_group_id bigint,
    aggr_protocol_num character varying(2000),
    appl_documentum_num character varying(2000),
    yaig_base_code bigint
);



--
-- Name: TABLE yaig_client_guarantee; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.yaig_client_guarantee IS 'УАиГ. Гарантия клиента, SysObjTypeEffective{id=3891338, ident=''YAIG_CLIENT_GUARANTEE'', name=''УАиГ. Гарантия клиента'', 12 attributes (12 actualizing)}';


--
-- Name: COLUMN yaig_client_guarantee.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.id IS 'ID';


--
-- Name: COLUMN yaig_client_guarantee.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN yaig_client_guarantee.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN yaig_client_guarantee.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.name IS 'Name';


--
-- Name: COLUMN yaig_client_guarantee.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.create_date IS 'Create date';


--
-- Name: COLUMN yaig_client_guarantee.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.type_id IS 'Тип объекта';


--
-- Name: COLUMN yaig_client_guarantee.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.status IS 'Status';


--
-- Name: COLUMN yaig_client_guarantee.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.org_id IS 'Подразделение';


--
-- Name: COLUMN yaig_client_guarantee.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.user_id IS 'Пользователь';


--
-- Name: COLUMN yaig_client_guarantee.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN yaig_client_guarantee.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN yaig_client_guarantee.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN yaig_client_guarantee.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN yaig_client_guarantee.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.is_system IS 'System object';


--
-- Name: COLUMN yaig_client_guarantee.yaig_client_princip_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.yaig_client_princip_id IS 'УАиГ клиент';


--
-- Name: COLUMN yaig_client_guarantee.yaig_product_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.yaig_product_id IS 'Продукт';


--
-- Name: COLUMN yaig_client_guarantee.yaig_guar_summ; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.yaig_guar_summ IS 'Сумма гарантии';


--
-- Name: COLUMN yaig_client_guarantee.yaig_manager_name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.yaig_manager_name IS 'Менеджер клиента';


--
-- Name: COLUMN yaig_client_guarantee.yaig_risk_group; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.yaig_risk_group IS 'Группа риска';


--
-- Name: COLUMN yaig_client_guarantee.yaig_manager_code; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.yaig_manager_code IS 'Табельный номер клиентского менеджера';


--
-- Name: COLUMN yaig_client_guarantee.yaig_quality_categ; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.yaig_quality_categ IS 'Категория качества';


--
-- Name: COLUMN yaig_client_guarantee.yaig_guar_type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.yaig_guar_type_id IS 'Тип гарантии';


--
-- Name: COLUMN yaig_client_guarantee.yaig_prnt_gen_agr_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.yaig_prnt_gen_agr_id IS 'Генеральное соглашение';


--
-- Name: COLUMN yaig_client_guarantee.yaig_cur_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.yaig_cur_id IS 'Валюта гарантии';


--
-- Name: COLUMN yaig_client_guarantee.yaig_client_link; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.yaig_client_link IS 'Ссылка на клиента';


--
-- Name: COLUMN yaig_client_guarantee.yaig_date_close; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.yaig_date_close IS 'Дата истечения гарантии';


--
-- Name: COLUMN yaig_client_guarantee.yaig_date_open; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.yaig_date_open IS 'Дата открытия гарантии';


--
-- Name: COLUMN yaig_client_guarantee.yaig_guar_num; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.yaig_guar_num IS 'Номер гарантии';


--
-- Name: COLUMN yaig_client_guarantee.yaig_guarantee_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.yaig_guarantee_id IS 'ID гарантии';


--
-- Name: COLUMN yaig_client_guarantee.yaig_sum_commis; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.yaig_sum_commis IS 'Сумма комиссий';


--
-- Name: COLUMN yaig_client_guarantee.yaig_manager_code_str; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.yaig_manager_code_str IS 'Табельный номер клиентского менеджера (Строка)';


--
-- Name: COLUMN yaig_client_guarantee.yaig_guar_disclosure; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.yaig_guar_disclosure IS 'Дата раскрытия гарантии';


--
-- Name: COLUMN yaig_client_guarantee.yaig_guar_payments_bool; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.yaig_guar_payments_bool IS 'Признак раскрытия гарантии';


--
-- Name: COLUMN yaig_client_guarantee.yaig_guar_payment; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.yaig_guar_payment IS '(Число) Признак раскрытия гарантии';


--
-- Name: COLUMN yaig_client_guarantee.contr_group_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.contr_group_id IS 'Контрактная группа';


--
-- Name: COLUMN yaig_client_guarantee.aggr_protocol_num; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.aggr_protocol_num IS 'Номер протокола';


--
-- Name: COLUMN yaig_client_guarantee.appl_documentum_num; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.appl_documentum_num IS 'Номер заявки в Documentum';


--
-- Name: COLUMN yaig_client_guarantee.yaig_base_code; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_client_guarantee.yaig_base_code IS 'Код базы НА';


--
-- Name: yaig_product_dict; Type: TABLE; Schema: public; Owner: moon_tuning
--

CREATE TABLE public.yaig_product_dict (
    id bigint NOT NULL,
    name__ru character varying(2000),
    name__en character varying(2000),
    name character varying(2000),
    create_date timestamp without time zone,
    type_id bigint,
    status smallint,
    org_id bigint,
    user_id bigint,
    last_modified_date timestamp without time zone,
    last_modified_user_id bigint,
    created_emp_id bigint,
    last_modified_emp_id bigint,
    is_system smallint,
    ident character varying(2000)
);



--
-- Name: TABLE yaig_product_dict; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON TABLE public.yaig_product_dict IS 'Справочник: УАиГ продукт, SysObjTypeEffective{id=3891244, ident=''YAIG_PRODUCT_DICT'', name=''Справочник: УАиГ продукт'', 12 attributes (12 actualizing)}';


--
-- Name: COLUMN yaig_product_dict.id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_product_dict.id IS 'ID';


--
-- Name: COLUMN yaig_product_dict.name__ru; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_product_dict.name__ru IS 'Name, languageSchema=ru';


--
-- Name: COLUMN yaig_product_dict.name__en; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_product_dict.name__en IS 'Name, languageSchema=en';


--
-- Name: COLUMN yaig_product_dict.name; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_product_dict.name IS 'Name';


--
-- Name: COLUMN yaig_product_dict.create_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_product_dict.create_date IS 'Create date';


--
-- Name: COLUMN yaig_product_dict.type_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_product_dict.type_id IS 'Тип объекта';


--
-- Name: COLUMN yaig_product_dict.status; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_product_dict.status IS 'Status';


--
-- Name: COLUMN yaig_product_dict.org_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_product_dict.org_id IS 'Подразделение';


--
-- Name: COLUMN yaig_product_dict.user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_product_dict.user_id IS 'Пользователь';


--
-- Name: COLUMN yaig_product_dict.last_modified_date; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_product_dict.last_modified_date IS 'Last modified date';


--
-- Name: COLUMN yaig_product_dict.last_modified_user_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_product_dict.last_modified_user_id IS 'Пользователь, внесший последние изменения';


--
-- Name: COLUMN yaig_product_dict.created_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_product_dict.created_emp_id IS 'Сотрудник, создавший объект';


--
-- Name: COLUMN yaig_product_dict.last_modified_emp_id; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_product_dict.last_modified_emp_id IS 'Сотрудник, внесший последние изменения';


--
-- Name: COLUMN yaig_product_dict.is_system; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_product_dict.is_system IS 'System object';


--
-- Name: COLUMN yaig_product_dict.ident; Type: COMMENT; Schema: public; Owner: moon_tuning
--

COMMENT ON COLUMN public.yaig_product_dict.ident IS 'Сист. Идентификатор';


--
-- Name: credit_contract pk_26gyw381qtybb9ecaixs5afu5; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.credit_contract
    ADD CONSTRAINT pk_26gyw381qtybb9ecaixs5afu5 PRIMARY KEY (id);


--
-- Name: yaig_client_gen_agr pk_2ecdvtcv2qmg3ox7seaeel7j9; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.yaig_client_gen_agr
    ADD CONSTRAINT pk_2ecdvtcv2qmg3ox7seaeel7j9 PRIMARY KEY (id);


--
-- Name: fs_file pk_2hg1to5g1jc0mlvo9puyppldl; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.fs_file
    ADD CONSTRAINT pk_2hg1to5g1jc0mlvo9puyppldl PRIMARY KEY (id);


--
-- Name: ms_9k60rv4p0oaf3c702f2l1gj77 pk_2odewklgbwye03j8j6a0x06qi; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_9k60rv4p0oaf3c702f2l1gj77
    ADD CONSTRAINT pk_2odewklgbwye03j8j6a0x06qi PRIMARY KEY (id, obj_id);


--
-- Name: business_segment pk_2pj8oiq26x4cnmwm3pxyr25rk; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.business_segment
    ADD CONSTRAINT pk_2pj8oiq26x4cnmwm3pxyr25rk PRIMARY KEY (id);


--
-- Name: prod_change_params pk_4apel0kvrrc250ufm2tmi6ivj; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.prod_change_params
    ADD CONSTRAINT pk_4apel0kvrrc250ufm2tmi6ivj PRIMARY KEY (id);


--
-- Name: prod_guarantees pk_5qifr6hh9akgg6k3gecvelrvr; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.prod_guarantees
    ADD CONSTRAINT pk_5qifr6hh9akgg6k3gecvelrvr PRIMARY KEY (id);


--
-- Name: dict_product pk_5snacisr1eh4ash3pjhkxlnec; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.dict_product
    ADD CONSTRAINT pk_5snacisr1eh4ash3pjhkxlnec PRIMARY KEY (id);


--
-- Name: scp_project_ans pk_67lnn0b20yl5bd687jiumng0w; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_project_ans
    ADD CONSTRAINT pk_67lnn0b20yl5bd687jiumng0w PRIMARY KEY (id);


--
-- Name: ic_application pk_6tt7gq94u7cktqfdjyhdbe41r; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ic_application
    ADD CONSTRAINT pk_6tt7gq94u7cktqfdjyhdbe41r PRIMARY KEY (id);


--
-- Name: participant_app pk_70bjreb27ygiafo0dn14yf7fv; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.participant_app
    ADD CONSTRAINT pk_70bjreb27ygiafo0dn14yf7fv PRIMARY KEY (id);


--
-- Name: scp_dict_tech_ctredit pk_76tt2nly1ibtwr9gr9l2h10u8; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_dict_tech_ctredit
    ADD CONSTRAINT pk_76tt2nly1ibtwr9gr9l2h10u8 PRIMARY KEY (id);


--
-- Name: sys_company pk_7es09uc9547y92qpqmybxi6b4; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.sys_company
    ADD CONSTRAINT pk_7es09uc9547y92qpqmybxi6b4 PRIMARY KEY (id);


--
-- Name: scp_prod_guarant_dict pk_7f810nedo1fywrgkd17jtd6f0; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_prod_guarant_dict
    ADD CONSTRAINT pk_7f810nedo1fywrgkd17jtd6f0 PRIMARY KEY (id);


--
-- Name: sys_object pk_7hgumtiuqnlrutt1ib2jverv0; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.sys_object
    ADD CONSTRAINT pk_7hgumtiuqnlrutt1ib2jverv0 PRIMARY KEY (id);


--
-- Name: scp_amd_product pk_815lvjsbkisyxxdu81xx6qlsb; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_amd_product
    ADD CONSTRAINT pk_815lvjsbkisyxxdu81xx6qlsb PRIMARY KEY (id);


--
-- Name: corp_tech_application pk_91x7vfi1uetmddvg2c14jiuqg; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.corp_tech_application
    ADD CONSTRAINT pk_91x7vfi1uetmddvg2c14jiuqg PRIMARY KEY (id);


--
-- Name: ms_dxsh6488ihf77xmsd43dwby6k pk_93n8xfgrbinlhh26msshmue1r; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_dxsh6488ihf77xmsd43dwby6k
    ADD CONSTRAINT pk_93n8xfgrbinlhh26msshmue1r PRIMARY KEY (id, obj_id);


--
-- Name: product_pricing pk_97wg3gujuy89c1bfs5rbcppe2; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.product_pricing
    ADD CONSTRAINT pk_97wg3gujuy89c1bfs5rbcppe2 PRIMARY KEY (id);


--
-- Name: yaig_client_guarantee pk_a4bfetgqjs0fi5w5atnh3tlc5; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.yaig_client_guarantee
    ADD CONSTRAINT pk_a4bfetgqjs0fi5w5atnh3tlc5 PRIMARY KEY (id);


--
-- Name: afhd_ac_trans_link pk_aao0wboyjush8i9os0f850cma; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.afhd_ac_trans_link
    ADD CONSTRAINT pk_aao0wboyjush8i9os0f850cma PRIMARY KEY (id);


--
-- Name: count_turnover pk_ao0mxlicg5n3km77bgs8ux5ye; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.count_turnover
    ADD CONSTRAINT pk_ao0mxlicg5n3km77bgs8ux5ye PRIMARY KEY (id);


--
-- Name: yaig_product_dict pk_avc7ipwrd4tpqf43sd59vb9c9; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.yaig_product_dict
    ADD CONSTRAINT pk_avc7ipwrd4tpqf43sd59vb9c9 PRIMARY KEY (id);


--
-- Name: scp_prod_guar_dict pk_b260vf66dewvlv3kigisvplu2; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_prod_guar_dict
    ADD CONSTRAINT pk_b260vf66dewvlv3kigisvplu2 PRIMARY KEY (id);


--
-- Name: ms_d1oakp9uq175ak3dbhpzbu81d pk_csp05y7hn2p6ypmwwcl4w66xg; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_d1oakp9uq175ak3dbhpzbu81d
    ADD CONSTRAINT pk_csp05y7hn2p6ypmwwcl4w66xg PRIMARY KEY (id, obj_id);


--
-- Name: tbs_type pk_cxivf0upxmn9mkjiawvudnp0w; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.tbs_type
    ADD CONSTRAINT pk_cxivf0upxmn9mkjiawvudnp0w PRIMARY KEY (id);


--
-- Name: application_obj pk_dl9xpg5i0ta62b15bavpbrjx9; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.application_obj
    ADD CONSTRAINT pk_dl9xpg5i0ta62b15bavpbrjx9 PRIMARY KEY (id);


--
-- Name: dict_div_presence pk_dw8863276we2xlsdyo9nl48lk; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.dict_div_presence
    ADD CONSTRAINT pk_dw8863276we2xlsdyo9nl48lk PRIMARY KEY (id);


--
-- Name: ms_dlggiqkhqj46rhq1lrgryim7c pk_eo3w5my06sl3tfem5wuvy17fc; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_dlggiqkhqj46rhq1lrgryim7c
    ADD CONSTRAINT pk_eo3w5my06sl3tfem5wuvy17fc PRIMARY KEY (id, obj_id);


--
-- Name: scp_sec_expertise pk_f2jdnm20mjmpswho2opsd963x; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_sec_expertise
    ADD CONSTRAINT pk_f2jdnm20mjmpswho2opsd963x PRIMARY KEY (id);


--
-- Name: cb_interest_rate pk_fj0gs3krdvfy8eh5d9p62650t; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.cb_interest_rate
    ADD CONSTRAINT pk_fj0gs3krdvfy8eh5d9p62650t PRIMARY KEY (id);


--
-- Name: scp_collateral_app pk_flg61w7v5npxqo35ptyefsaf4; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_collateral_app
    ADD CONSTRAINT pk_flg61w7v5npxqo35ptyefsaf4 PRIMARY KEY (id);


--
-- Name: ms_e5lum3lbateqhx8wkgtstxdf9 pk_gm0bo1du4ngx5v9imkedfuy3h; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_e5lum3lbateqhx8wkgtstxdf9
    ADD CONSTRAINT pk_gm0bo1du4ngx5v9imkedfuy3h PRIMARY KEY (id, obj_id);


--
-- Name: scp_dict_product_na pk_gu9puko4o8ew59rq9g85sdxp4; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_dict_product_na
    ADD CONSTRAINT pk_gu9puko4o8ew59rq9g85sdxp4 PRIMARY KEY (id);


--
-- Name: scp_sec_check_res pk_hbejfp9hkq6k9t7234g9nv4s6; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_sec_check_res
    ADD CONSTRAINT pk_hbejfp9hkq6k9t7234g9nv4s6 PRIMARY KEY (id);


--
-- Name: mler_application pk_hi174ts2fbudrhmj6q1dh818h; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.mler_application
    ADD CONSTRAINT pk_hi174ts2fbudrhmj6q1dh818h PRIMARY KEY (id);


--
-- Name: sys_algorithm pk_hi1shs45ep5mfnwtyjrumsl8c; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.sys_algorithm
    ADD CONSTRAINT pk_hi1shs45ep5mfnwtyjrumsl8c PRIMARY KEY (id);


--
-- Name: ms_965j58mgwkpomnuooc29dlq9f pk_j9lxhovmpanh77wtq2q0qqffg; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_965j58mgwkpomnuooc29dlq9f
    ADD CONSTRAINT pk_j9lxhovmpanh77wtq2q0qqffg PRIMARY KEY (id, obj_id);


--
-- Name: scp_prod_comm_dict pk_k41r27007rggul8nuic1tjoyu; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_prod_comm_dict
    ADD CONSTRAINT pk_k41r27007rggul8nuic1tjoyu PRIMARY KEY (id);


--
-- Name: scp_dict_rsc_office pk_k8nke9ky9t135ml84ojlnfxh9; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_dict_rsc_office
    ADD CONSTRAINT pk_k8nke9ky9t135ml84ojlnfxh9 PRIMARY KEY (id);


--
-- Name: ms_1fd5jp86pabxu9na4knwphvyr pk_k90sf1plgoa39gy5kqcyfsaxk; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_1fd5jp86pabxu9na4knwphvyr
    ADD CONSTRAINT pk_k90sf1plgoa39gy5kqcyfsaxk PRIMARY KEY (id, obj_id);


--
-- Name: sys_state pk_kwcp0bwrlac8nm0n6ktnce22w; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.sys_state
    ADD CONSTRAINT pk_kwcp0bwrlac8nm0n6ktnce22w PRIMARY KEY (id);


--
-- Name: scp_techcred pk_kxethnkw7u1n71tbnlwvrdb42; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_techcred
    ADD CONSTRAINT pk_kxethnkw7u1n71tbnlwvrdb42 PRIMARY KEY (id);


--
-- Name: ms_0golbfqyrdq4im6jf6ajivwy9 pk_l1i4qmku796jdgl38dylpb247; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_0golbfqyrdq4im6jf6ajivwy9
    ADD CONSTRAINT pk_l1i4qmku796jdgl38dylpb247 PRIMARY KEY (id, obj_id);


--
-- Name: offices_psb pk_lwmo23msuucxp9v0k3g3uyk0i; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.offices_psb
    ADD CONSTRAINT pk_lwmo23msuucxp9v0k3g3uyk0i PRIMARY KEY (id);


--
-- Name: ms_0n8ohjyx7oszo6a47ca9g0s6f pk_nl6jf8o7ecdg5954qm4v1pq56; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_0n8ohjyx7oszo6a47ca9g0s6f
    ADD CONSTRAINT pk_nl6jf8o7ecdg5954qm4v1pq56 PRIMARY KEY (id, obj_id);


--
-- Name: ms_39qrctc1n8efr9axiukjssgzl pk_nqxi5gdy8w0rxvqfxrry3gaqf; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_39qrctc1n8efr9axiukjssgzl
    ADD CONSTRAINT pk_nqxi5gdy8w0rxvqfxrry3gaqf PRIMARY KEY (id, obj_id);


--
-- Name: scp_decision_quest pk_nuqa7fyprg4u0ciny39g4bu22; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_decision_quest
    ADD CONSTRAINT pk_nuqa7fyprg4u0ciny39g4bu22 PRIMARY KEY (id);


--
-- Name: scp_part_sec_expertise pk_nxl7x5n5kj7pbb4qykb85b4j6; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_part_sec_expertise
    ADD CONSTRAINT pk_nxl7x5n5kj7pbb4qykb85b4j6 PRIMARY KEY (id);


--
-- Name: ms_64cm5ded37z58x0fyt5lgvhc7 pk_o4gfq4oadkrfhy4oetth1awfb; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_64cm5ded37z58x0fyt5lgvhc7
    ADD CONSTRAINT pk_o4gfq4oadkrfhy4oetth1awfb PRIMARY KEY (id, obj_id);


--
-- Name: scp_gov_program_dict pk_o8x3g0oj7le9qvxwu716smdkv; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_gov_program_dict
    ADD CONSTRAINT pk_o8x3g0oj7le9qvxwu716smdkv PRIMARY KEY (id);


--
-- Name: scp_application pk_pa0ln0y24tioxf2r5qbfim0xj; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_application
    ADD CONSTRAINT pk_pa0ln0y24tioxf2r5qbfim0xj PRIMARY KEY (id);


--
-- Name: sys_obj_resp pk_ps4dyp6rvmntd0ppagjo76jjs; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.sys_obj_resp
    ADD CONSTRAINT pk_ps4dyp6rvmntd0ppagjo76jjs PRIMARY KEY (id);


--
-- Name: type_loan pk_rg2vys5o1ktjrqvty8cnnqbeg; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.type_loan
    ADD CONSTRAINT pk_rg2vys5o1ktjrqvty8cnnqbeg PRIMARY KEY (id);


--
-- Name: acc_number pk_ry6miygoqf3361k8w1tu4ss17; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.acc_number
    ADD CONSTRAINT pk_ry6miygoqf3361k8w1tu4ss17 PRIMARY KEY (id);


--
-- Name: ms_333s6j5jn97srp008gyi3zueo pk_s9cudrmx606gomyxi3u7t8hn7; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_333s6j5jn97srp008gyi3zueo
    ADD CONSTRAINT pk_s9cudrmx606gomyxi3u7t8hn7 PRIMARY KEY (id, obj_id);


--
-- Name: sys_obj_type pk_slwl68v70fg1yrsas8df7aq6k; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.sys_obj_type
    ADD CONSTRAINT pk_slwl68v70fg1yrsas8df7aq6k PRIMARY KEY (id);


--
-- Name: ms_0oc5mpme8nklimjy77sai9gf1 pk_tfqgukw55c5l6o9amfvaga4f2; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_0oc5mpme8nklimjy77sai9gf1
    ADD CONSTRAINT pk_tfqgukw55c5l6o9amfvaga4f2 PRIMARY KEY (id, obj_id);


--
-- Name: prod_commissions pk_tq4ohopm89nuqefa4p39kpolk; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.prod_commissions
    ADD CONSTRAINT pk_tq4ohopm89nuqefa4p39kpolk PRIMARY KEY (id);


--
-- Name: sys_employee sys_employee_id_pk_idx; Type: CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.sys_employee
    ADD CONSTRAINT sys_employee_id_pk_idx PRIMARY KEY (id);


--
-- Name: dict_product fk_13v56vqsdh04i02lstqii9mf9; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: overdraft_limit
-- ALTER TABLE ONLY public.dict_product
--     ADD CONSTRAINT fk_13v56vqsdh04i02lstqii9mf9 FOREIGN KEY (overdraft_limit_id) REFERENCES public.overdraft_limit(id);


--
-- Name: count_turnover fk_165j9yy4sg81ukha6kjvub2eo; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: risk_form_row_spr
-- ALTER TABLE ONLY public.count_turnover
--     ADD CONSTRAINT fk_165j9yy4sg81ukha6kjvub2eo FOREIGN KEY (bb_debet_input_id) REFERENCES public.risk_form_row_spr(id);


--
-- Name: product_pricing fk_1aca0mpo2daruq95uvqleptrj; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: draft_decision
-- ALTER TABLE ONLY public.product_pricing
--     ADD CONSTRAINT fk_1aca0mpo2daruq95uvqleptrj FOREIGN KEY (draft_decision_id) REFERENCES public.draft_decision(id);


--
-- Name: scp_application fk_1d09ioef1qs1o05gwia5on2sh; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_processing_steps
-- ALTER TABLE ONLY public.scp_application
--     ADD CONSTRAINT fk_1d09ioef1qs1o05gwia5on2sh FOREIGN KEY (processing_steps_id) REFERENCES public.dict_processing_steps(id);


--
-- Name: fs_file fk_1f74vrccwpbabg6w4e3ec7nkf; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: fs_storage
-- ALTER TABLE ONLY public.fs_file
--     ADD CONSTRAINT fk_1f74vrccwpbabg6w4e3ec7nkf FOREIGN KEY (ff_storage_id) REFERENCES public.fs_storage(id);


--
-- Name: yaig_client_guarantee fk_1me40j600dbgqf8dwqm0nixh5; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.yaig_client_guarantee
    ADD CONSTRAINT fk_1me40j600dbgqf8dwqm0nixh5 FOREIGN KEY (yaig_prnt_gen_agr_id) REFERENCES public.yaig_client_gen_agr(id);


--
-- Name: credit_contract fk_1rm3g8hdw656q08rld9lmjo6y; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: etl_verification_na
-- ALTER TABLE ONLY public.credit_contract
--     ADD CONSTRAINT fk_1rm3g8hdw656q08rld9lmjo6y FOREIGN KEY (tech_link_etl_state_id) REFERENCES public.etl_verification_na(id);


--
-- Name: scp_application fk_1u255ghkb55runj97ux7crw5m; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_reason_client
-- ALTER TABLE ONLY public.scp_application
--     ADD CONSTRAINT fk_1u255ghkb55runj97ux7crw5m FOREIGN KEY (scp_rejection_client_id) REFERENCES public.scp_dict_reason_client(id);


--
-- Name: scp_application fk_1up5ui344cauuxpd0dcv3t7um; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: undwrt_decis_level_dict
-- ALTER TABLE ONLY public.scp_application
--     ADD CONSTRAINT fk_1up5ui344cauuxpd0dcv3t7um FOREIGN KEY (ca_decis_level_id) REFERENCES public.undwrt_decis_level_dict(id);


--
-- Name: scp_sec_expertise fk_1wqrkbqdjabakla0jde0khg6j; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: standard_fact_app
-- ALTER TABLE ONLY public.scp_sec_expertise
--     ADD CONSTRAINT fk_1wqrkbqdjabakla0jde0khg6j FOREIGN KEY (sf_app_obj_id) REFERENCES public.standard_fact_app(id);


--
-- Name: yaig_client_gen_agr fk_233lpt1amfv0h2rkrxqvj4q3f; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: yaig_client_principal
-- ALTER TABLE ONLY public.yaig_client_gen_agr
--     ADD CONSTRAINT fk_233lpt1amfv0h2rkrxqvj4q3f FOREIGN KEY (yaig_client_princip_id) REFERENCES public.yaig_client_principal(id);


--
-- Name: scp_application fk_24iy1hu42tnh941ixaiut4xtg; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_application
    ADD CONSTRAINT fk_24iy1hu42tnh941ixaiut4xtg FOREIGN KEY (credit_logic_id) REFERENCES public.scp_techcred(id);


--
-- Name: scp_sec_check_res fk_24jxsnfk821i7p1kli04yr6mw; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_sec_check_res
    ADD CONSTRAINT fk_24jxsnfk821i7p1kli04yr6mw FOREIGN KEY (expertise_obj_id) REFERENCES public.sys_object(id);


--
-- Name: credit_contract fk_26vniicfk4rdqlr147s0jdmll; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_contracttype
-- ALTER TABLE ONLY public.credit_contract
--     ADD CONSTRAINT fk_26vniicfk4rdqlr147s0jdmll FOREIGN KEY (contracttype) REFERENCES public.dict_contracttype(id);


--
-- Name: scp_project_ans fk_28cec5c0x9ago1pjbtkxdlf55; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_project_ans
    ADD CONSTRAINT fk_28cec5c0x9ago1pjbtkxdlf55 FOREIGN KEY (amdp_parent_product_id) REFERENCES public.scp_amd_product(id);


--
-- Name: scp_part_sec_expertise fk_293j59bqeb6r1sfxx6qpr02a2; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_auto_check_trigger
-- ALTER TABLE ONLY public.scp_part_sec_expertise
--     ADD CONSTRAINT fk_293j59bqeb6r1sfxx6qpr02a2 FOREIGN KEY (repeat_check) REFERENCES public.scp_auto_check_trigger(id);


--
-- Name: scp_application fk_29g0u8uqouur9uqd8dcbljnjx; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_application
    ADD CONSTRAINT fk_29g0u8uqouur9uqd8dcbljnjx FOREIGN KEY (scp_business_segment) REFERENCES public.business_segment(id);


--
-- Name: participant_app fk_29nqxwa62g7xpjxe9pivv8g9j; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.participant_app
    ADD CONSTRAINT fk_29nqxwa62g7xpjxe9pivv8g9j FOREIGN KEY (emp_appeal_id) REFERENCES public.sys_employee(id);


--
-- Name: scp_amd_product fk_2bnpw1m5kq7cpw0f1kyuyqyj4; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_type_gov_prog
-- ALTER TABLE ONLY public.scp_amd_product
--     ADD CONSTRAINT fk_2bnpw1m5kq7cpw0f1kyuyqyj4 FOREIGN KEY (type_gov_prog_id) REFERENCES public.scp_type_gov_prog(id);


--
-- Name: scp_application fk_2bpvqoo6wqc2wbjbx1oq841th; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_application
    ADD CONSTRAINT fk_2bpvqoo6wqc2wbjbx1oq841th FOREIGN KEY (scp_tech_ctredit) REFERENCES public.scp_dict_tech_ctredit(id);


--
-- Name: corp_tech_application fk_2ct8d6pg5ade1w152v0mfm8fn; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.corp_tech_application
    ADD CONSTRAINT fk_2ct8d6pg5ade1w152v0mfm8fn FOREIGN KEY (collat_initiator_id) REFERENCES public.sys_employee(id);


--
-- Name: sys_company fk_2cxrsocumyysfa0fl6oyyt76m; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.sys_company
    ADD CONSTRAINT fk_2cxrsocumyysfa0fl6oyyt76m FOREIGN KEY (business_segment) REFERENCES public.business_segment(id);


--
-- Name: scp_part_sec_expertise fk_2eqp5guc6fin7dgg91u9crfwd; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_part_sec_expertise
    ADD CONSTRAINT fk_2eqp5guc6fin7dgg91u9crfwd FOREIGN KEY (sf_sec_rs_emp_id) REFERENCES public.sys_employee(id);


--
-- Name: sys_obj_resp fk_2h5v8tircbqea98an8hjuf0rj; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.sys_obj_resp
    ADD CONSTRAINT fk_2h5v8tircbqea98an8hjuf0rj FOREIGN KEY (afe_emp_id) REFERENCES public.sys_employee(id);


--
-- Name: yaig_client_guarantee fk_2mgpeafcsa7lc6vt17e42ohki; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: yaig_guar_type_dict
-- ALTER TABLE ONLY public.yaig_client_guarantee
--     ADD CONSTRAINT fk_2mgpeafcsa7lc6vt17e42ohki FOREIGN KEY (yaig_guar_type_id) REFERENCES public.yaig_guar_type_dict(id);


--
-- Name: scp_collateral_app fk_2nedossjn5etfcnlg0v83dxkf; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_quality_category
-- ALTER TABLE ONLY public.scp_collateral_app
--     ADD CONSTRAINT fk_2nedossjn5etfcnlg0v83dxkf FOREIGN KEY (security_quality_id) REFERENCES public.dict_quality_category(id);


--
-- Name: scp_project_ans fk_2ormw6aftp2hwcat2bsrsdxgo; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_project_ans
    ADD CONSTRAINT fk_2ormw6aftp2hwcat2bsrsdxgo FOREIGN KEY (voting_km_id) REFERENCES public.sys_employee(id);


--
-- Name: mler_application fk_2pd3uw4b0o9pc76ijd5nh7es2; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.mler_application
    ADD CONSTRAINT fk_2pd3uw4b0o9pc76ijd5nh7es2 FOREIGN KEY (afp_state_id) REFERENCES public.sys_state(id);


--
-- Name: scp_sec_expertise fk_2r2x7f814qbm0c1fwul77icch; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: traf_lignts_check_cl
-- ALTER TABLE ONLY public.scp_sec_expertise
--     ADD CONSTRAINT fk_2r2x7f814qbm0c1fwul77icch FOREIGN KEY (traf_lights_response_id) REFERENCES public.traf_lignts_check_cl(id);


--
-- Name: sys_obj_resp fk_2s9q88amg7texq186t2rsem6r; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.sys_obj_resp
    ADD CONSTRAINT fk_2s9q88amg7texq186t2rsem6r FOREIGN KEY (afe_manage_emp) REFERENCES public.sys_employee(id);


--
-- Name: scp_prod_guar_dict fk_2ug12djhn36p4212wbv2rgeu6; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_prod_guar_dict
    ADD CONSTRAINT fk_2ug12djhn36p4212wbv2rgeu6 FOREIGN KEY (scp_gov_program_id) REFERENCES public.scp_gov_program_dict(id);


--
-- Name: yaig_client_gen_agr fk_2v0qc67mnwxxdkweulwsiwv8k; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.yaig_client_gen_agr
    ADD CONSTRAINT fk_2v0qc67mnwxxdkweulwsiwv8k FOREIGN KEY (yaig_client_link) REFERENCES public.sys_company(id);


--
-- Name: scp_sec_expertise fk_2y40xv63bml3c3st2v6pebmkr; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_sec_expertise
    ADD CONSTRAINT fk_2y40xv63bml3c3st2v6pebmkr FOREIGN KEY (afp_state_id) REFERENCES public.sys_state(id);


--
-- Name: corp_tech_application fk_34opcb9prvwm354t50beufung; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: temp_obj_load_turn
-- ALTER TABLE ONLY public.corp_tech_application
--     ADD CONSTRAINT fk_34opcb9prvwm354t50beufung FOREIGN KEY (temp_cont_turn) REFERENCES public.temp_obj_load_turn(id);


--
-- Name: scp_decision_quest fk_376gw63y85r2prmf202jlm6q0; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_decision_quest
    ADD CONSTRAINT fk_376gw63y85r2prmf202jlm6q0 FOREIGN KEY (scp_gov_program_id) REFERENCES public.scp_gov_program_dict(id);


--
-- Name: scp_decision_quest fk_3bmsprqb8vueq24yt5vnp5sbi; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_decision_quest
    ADD CONSTRAINT fk_3bmsprqb8vueq24yt5vnp5sbi FOREIGN KEY (type_loan_id) REFERENCES public.type_loan(id);


--
-- Name: scp_part_sec_expertise fk_3cr6akokrvjr8wckb3c86dlbu; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_part_sec_expertise
    ADD CONSTRAINT fk_3cr6akokrvjr8wckb3c86dlbu FOREIGN KEY (sec_ch_res_list) REFERENCES public.scp_sec_check_res(id);


--
-- Name: participant_app fk_3ha9hu5s0ui1np1m1dg8xcb4f; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.participant_app
    ADD CONSTRAINT fk_3ha9hu5s0ui1np1m1dg8xcb4f FOREIGN KEY (borrower_id) REFERENCES public.sys_company(id);


--
-- Name: product_pricing fk_3w31p9i42xcb4updymp1nu9pg; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.product_pricing
    ADD CONSTRAINT fk_3w31p9i42xcb4updymp1nu9pg FOREIGN KEY (app_product_id) REFERENCES public.dict_product(id);


--
-- Name: sys_employee fk_3xccqncke0fhugr3260d5an72; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: sys_time_zone
-- ALTER TABLE ONLY public.sys_employee
--     ADD CONSTRAINT fk_3xccqncke0fhugr3260d5an72 FOREIGN KEY (time_zone) REFERENCES public.sys_time_zone(id);


--
-- Name: prod_change_params fk_4035wun01oll20e6cweg86duv; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: pay_reward_cond_dict
-- ALTER TABLE ONLY public.prod_change_params
--     ADD CONSTRAINT fk_4035wun01oll20e6cweg86duv FOREIGN KEY (pay_reward_cond_id) REFERENCES public.pay_reward_cond_dict(id);


--
-- Name: credit_contract fk_42gx8rhb1vtvw5g0vfjw5oxq6; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_suspension_cd_na
-- ALTER TABLE ONLY public.credit_contract
--     ADD CONSTRAINT fk_42gx8rhb1vtvw5g0vfjw5oxq6 FOREIGN KEY (suspension_na_id) REFERENCES public.dict_suspension_cd_na(id);


--
-- Name: scp_project_ans fk_466a99cisu0oyqhxfn25kv6t3; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_project_ans
    ADD CONSTRAINT fk_466a99cisu0oyqhxfn25kv6t3 FOREIGN KEY (req_link_id) REFERENCES public.application_obj(id);


--
-- Name: scp_collateral_app fk_475nt34eh9um49gqs4e5umbp1; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_collateral_app
    ADD CONSTRAINT fk_475nt34eh9um49gqs4e5umbp1 FOREIGN KEY (perform_hr_face_id) REFERENCES public.sys_employee(id);


--
-- Name: scp_amd_product fk_480qttrvtt5ixiahjiacjxlw1; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: clc_grades
-- ALTER TABLE ONLY public.scp_amd_product
--     ADD CONSTRAINT fk_480qttrvtt5ixiahjiacjxlw1 FOREIGN KEY (clc_grade_id) REFERENCES public.clc_grades(id);


--
-- Name: sys_obj_type fk_497f1arx9hnahaah8dclghb17; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: sys_alg_card
-- ALTER TABLE ONLY public.sys_obj_type
--     ADD CONSTRAINT fk_497f1arx9hnahaah8dclghb17 FOREIGN KEY (alg_saving_id) REFERENCES public.sys_alg_card(id);


--
-- Name: scp_collateral_app fk_499hbjogy0fg1dy7knh527iqv; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_group_quality
-- ALTER TABLE ONLY public.scp_collateral_app
--     ADD CONSTRAINT fk_499hbjogy0fg1dy7knh527iqv FOREIGN KEY (quality_group_id) REFERENCES public.dict_group_quality(id);


--
-- Name: scp_decision_quest fk_49gq3v69c7k9iqhhlcbnbl2vi; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_decision_quest
    ADD CONSTRAINT fk_49gq3v69c7k9iqhhlcbnbl2vi FOREIGN KEY (scp_project_ans_link) REFERENCES public.scp_project_ans(id);


--
-- Name: prod_commissions fk_4bq55w30p8cooqw4uahrhbogy; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: sum_pay_type_dict
-- ALTER TABLE ONLY public.prod_commissions
--     ADD CONSTRAINT fk_4bq55w30p8cooqw4uahrhbogy FOREIGN KEY (sum_pay_type_id) REFERENCES public.sum_pay_type_dict(id);


--
-- Name: mler_application fk_4d6btm6sg62y91j9td2runrpm; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_processing_steps
-- ALTER TABLE ONLY public.mler_application
--     ADD CONSTRAINT fk_4d6btm6sg62y91j9td2runrpm FOREIGN KEY (processing_steps_id) REFERENCES public.dict_processing_steps(id);


--
-- Name: ic_application fk_4du2fkrfxe0072wtr9dwjage8; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_proc_steps_dict
-- ALTER TABLE ONLY public.ic_application
--     ADD CONSTRAINT fk_4du2fkrfxe0072wtr9dwjage8 FOREIGN KEY (scp_proc_steds_id) REFERENCES public.scp_proc_steps_dict(id);


--
-- Name: scp_collateral_app fk_4gau6pf3ptv6u1e4ehk56csq1; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_collateral_app
    ADD CONSTRAINT fk_4gau6pf3ptv6u1e4ehk56csq1 FOREIGN KEY (pledge_concl_state_id) REFERENCES public.sys_state(id);


--
-- Name: sys_employee fk_4h0hokguofcsfco25p7e1898u; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: sys_emp_schedule
-- ALTER TABLE ONLY public.sys_employee
--     ADD CONSTRAINT fk_4h0hokguofcsfco25p7e1898u FOREIGN KEY (workday_schedule_id) REFERENCES public.sys_emp_schedule(id);


--
-- Name: scp_collateral_app fk_4hr3j0adtkugk7tn5ptb6wcuh; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: spr_yes_no
-- ALTER TABLE ONLY public.scp_collateral_app
--     ADD CONSTRAINT fk_4hr3j0adtkugk7tn5ptb6wcuh FOREIGN KEY (scp_fin_proj_id) REFERENCES public.spr_yes_no(id);


--
-- Name: mler_application fk_4ohvq4d3xbt665v6i76y51o12; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_client_type
-- ALTER TABLE ONLY public.mler_application
--     ADD CONSTRAINT fk_4ohvq4d3xbt665v6i76y51o12 FOREIGN KEY (client_type_id) REFERENCES public.scp_dict_client_type(id);


--
-- Name: ic_application fk_4pjluncnbixcawkd4qqa5d0m8; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: credit_report
-- ALTER TABLE ONLY public.ic_application
--     ADD CONSTRAINT fk_4pjluncnbixcawkd4qqa5d0m8 FOREIGN KEY (cr_id) REFERENCES public.credit_report(id);


--
-- Name: mler_application fk_4rgy5nb9pq2tudg620uyts47y; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_industry_code
-- ALTER TABLE ONLY public.mler_application
--     ADD CONSTRAINT fk_4rgy5nb9pq2tudg620uyts47y FOREIGN KEY (industry_code_id) REFERENCES public.scp_dict_industry_code(id);


--
-- Name: scp_sec_check_res fk_4rw3ls2anbxc7u05ny4byfusb; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_scp_risk_zone
-- ALTER TABLE ONLY public.scp_sec_check_res
--     ADD CONSTRAINT fk_4rw3ls2anbxc7u05ny4byfusb FOREIGN KEY (aspr_link_zone_id) REFERENCES public.dict_scp_risk_zone(id);


--
-- Name: scp_application fk_4tb38kh4rtupxkx44wn9fgk2q; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_application
    ADD CONSTRAINT fk_4tb38kh4rtupxkx44wn9fgk2q FOREIGN KEY (ca_rout_office_id) REFERENCES public.offices_psb(id);


--
-- Name: corp_tech_application fk_4xcrq6covxo2c0kyc0e251r8g; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: collateral_cont
-- ALTER TABLE ONLY public.corp_tech_application
--     ADD CONSTRAINT fk_4xcrq6covxo2c0kyc0e251r8g FOREIGN KEY (collateral_cont_id) REFERENCES public.collateral_cont(id);


--
-- Name: sys_algorithm fk_4xqbmqoo8nlx42s7169pqikf0; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: sys_alg_type
-- ALTER TABLE ONLY public.sys_algorithm
--     ADD CONSTRAINT fk_4xqbmqoo8nlx42s7169pqikf0 FOREIGN KEY (amy_alg_type_id) REFERENCES public.sys_alg_type(id);


--
-- Name: mler_application fk_4yykqggjcrh009ngycultpdrl; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: temp_obj_load_turn
-- ALTER TABLE ONLY public.mler_application
--     ADD CONSTRAINT fk_4yykqggjcrh009ngycultpdrl FOREIGN KEY (temp_cont_turn) REFERENCES public.temp_obj_load_turn(id);


--
-- Name: ic_application fk_50fyhliogmk0sfwy4s7si6aus; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_type_req
-- ALTER TABLE ONLY public.ic_application
--     ADD CONSTRAINT fk_50fyhliogmk0sfwy4s7si6aus FOREIGN KEY (req_type_id) REFERENCES public.scp_dict_type_req(id);


--
-- Name: count_turnover fk_52cjyjcugbnuotog1pi9nidle; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.count_turnover
    ADD CONSTRAINT fk_52cjyjcugbnuotog1pi9nidle FOREIGN KEY (correct_type) REFERENCES public.tbs_type(id);


--
-- Name: ic_application fk_54aml8c908vlxn1vf4q3aqcu2; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: afhd_gsl_data_cont
-- ALTER TABLE ONLY public.ic_application
--     ADD CONSTRAINT fk_54aml8c908vlxn1vf4q3aqcu2 FOREIGN KEY (gsl_data_cont_id) REFERENCES public.afhd_gsl_data_cont(id);


--
-- Name: offices_psb fk_55js7o07ctcqj5afkf56ls1em; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: sys_org_str
-- ALTER TABLE ONLY public.offices_psb
--     ADD CONSTRAINT fk_55js7o07ctcqj5afkf56ls1em FOREIGN KEY (parent_org_id) REFERENCES public.sys_org_str(id);


--
-- Name: afhd_ac_trans_link fk_59861jaq2aacst2300xhl9s9d; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: risk_form_row_spr
-- ALTER TABLE ONLY public.afhd_ac_trans_link
--     ADD CONSTRAINT fk_59861jaq2aacst2300xhl9s9d FOREIGN KEY (reclass_row_id) REFERENCES public.risk_form_row_spr(id);


--
-- Name: afhd_ac_trans_link fk_5avc013uogn95qaogjv9su4wd; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_debit_credit
-- ALTER TABLE ONLY public.afhd_ac_trans_link
--     ADD CONSTRAINT fk_5avc013uogn95qaogjv9su4wd FOREIGN KEY (debit_credit_id) REFERENCES public.dict_debit_credit(id);


--
-- Name: scp_project_ans fk_5bn33bejqtvr7rr9gyj3a1c9a; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_client_type
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_5bn33bejqtvr7rr9gyj3a1c9a FOREIGN KEY (client_type_id) REFERENCES public.scp_dict_client_type(id);


--
-- Name: sys_company fk_5dqdu3x1og7m77d55kxxqiecs; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: group_of_company
-- ALTER TABLE ONLY public.sys_company
--     ADD CONSTRAINT fk_5dqdu3x1og7m77d55kxxqiecs FOREIGN KEY (group_company_link) REFERENCES public.group_of_company(id);


--
-- Name: afhd_ac_trans_link fk_5dqjnetn8a4v2809uu7uf2278; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.afhd_ac_trans_link
    ADD CONSTRAINT fk_5dqjnetn8a4v2809uu7uf2278 FOREIGN KEY (obj_owner_id) REFERENCES public.sys_object(id);


--
-- Name: count_turnover fk_5ggruuce9k4lgh7x45fqgk7ly; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.count_turnover
    ADD CONSTRAINT fk_5ggruuce9k4lgh7x45fqgk7ly FOREIGN KEY (link_cnt_owner) REFERENCES public.sys_company(id);


--
-- Name: scp_part_sec_expertise fk_5hq61mqb506spi4x6vrvlwujc; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_part_sec_expertise
    ADD CONSTRAINT fk_5hq61mqb506spi4x6vrvlwujc FOREIGN KEY (emp_id) REFERENCES public.sys_employee(id);


--
-- Name: sys_employee fk_5hynjeq3m5w3679u0udstc1qj; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: sys_lang_schema
-- ALTER TABLE ONLY public.sys_employee
--     ADD CONSTRAINT fk_5hynjeq3m5w3679u0udstc1qj FOREIGN KEY (locale_id) REFERENCES public.sys_lang_schema(id);


--
-- Name: corp_tech_application fk_5kcajxhmdihjhq86she6ieotg; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_sec_conclusion
-- ALTER TABLE ONLY public.corp_tech_application
--     ADD CONSTRAINT fk_5kcajxhmdihjhq86she6ieotg FOREIGN KEY (sec_conclusion_id) REFERENCES public.scp_dict_sec_conclusion(id);


--
-- Name: scp_amd_product fk_5o6xn5rbey10o6tjp56sq7eys; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: draft_decision
-- ALTER TABLE ONLY public.scp_amd_product
--     ADD CONSTRAINT fk_5o6xn5rbey10o6tjp56sq7eys FOREIGN KEY (amd_proj_link) REFERENCES public.draft_decision(id);


--
-- Name: scp_sec_expertise fk_5p1ya4axtywjrtbwr3dm8ruae; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_sec_expertise
    ADD CONSTRAINT fk_5p1ya4axtywjrtbwr3dm8ruae FOREIGN KEY (sec_exp_copy_id) REFERENCES public.scp_sec_expertise(id);


--
-- Name: sys_employee fk_5q67brp7ppx0ehtlw5cb5wp4i; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: spr_job_pos
-- ALTER TABLE ONLY public.sys_employee
--     ADD CONSTRAINT fk_5q67brp7ppx0ehtlw5cb5wp4i FOREIGN KEY (job_pos_id) REFERENCES public.spr_job_pos(id);


--
-- Name: corp_tech_application fk_5ren7aodid9e4ob8cxjd868hy; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.corp_tech_application
    ADD CONSTRAINT fk_5ren7aodid9e4ob8cxjd868hy FOREIGN KEY (auto_check_status) REFERENCES public.sys_state(id);


--
-- Name: ms_9k60rv4p0oaf3c702f2l1gj77 fk_5rok9758f4wcxqig4e23mki0u; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_9k60rv4p0oaf3c702f2l1gj77
    ADD CONSTRAINT fk_5rok9758f4wcxqig4e23mki0u FOREIGN KEY (obj_id) REFERENCES public.scp_dict_tech_ctredit(id);


--
-- Name: product_pricing fk_5sivwijuxb93am7ahk2a63fe4; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_modif_lim_quest
-- ALTER TABLE ONLY public.product_pricing
--     ADD CONSTRAINT fk_5sivwijuxb93am7ahk2a63fe4 FOREIGN KEY (scp_modif_lim_quest_id) REFERENCES public.scp_modif_lim_quest(id);


--
-- Name: scp_project_ans fk_5ujyub8f6hf9sltibx0d34w56; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_project_ans
    ADD CONSTRAINT fk_5ujyub8f6hf9sltibx0d34w56 FOREIGN KEY (curator_head_id) REFERENCES public.sys_employee(id);


--
-- Name: scp_application fk_5wqy8d4r02rwwo71n1kj0rjkh; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_application
    ADD CONSTRAINT fk_5wqy8d4r02rwwo71n1kj0rjkh FOREIGN KEY (resp_cond_coord) REFERENCES public.sys_employee(id);


--
-- Name: scp_part_sec_expertise fk_60ynv6w8hq1q2kn9skqspbx9t; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_part_sec_expertise
    ADD CONSTRAINT fk_60ynv6w8hq1q2kn9skqspbx9t FOREIGN KEY (psb_office_id) REFERENCES public.offices_psb(id);


--
-- Name: afhd_ac_trans_link fk_629sedonsw1cjpubyyuuxyqbc; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: general_activity_guide
-- ALTER TABLE ONLY public.afhd_ac_trans_link
--     ADD CONSTRAINT fk_629sedonsw1cjpubyyuuxyqbc FOREIGN KEY (okved_activity_id) REFERENCES public.general_activity_guide(id);


--
-- Name: scp_decision_quest fk_62imt9rfqjswy52srpyrj8dv0; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_decision_quest
    ADD CONSTRAINT fk_62imt9rfqjswy52srpyrj8dv0 FOREIGN KEY (scp_dec_quest_id) REFERENCES public.scp_decision_quest(id);


--
-- Name: ms_0golbfqyrdq4im6jf6ajivwy9 fk_64855qkylmial0klooct1rhyf; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_0golbfqyrdq4im6jf6ajivwy9
    ADD CONSTRAINT fk_64855qkylmial0klooct1rhyf FOREIGN KEY (obj_id) REFERENCES public.business_segment(id);


--
-- Name: ic_application fk_66dhdflsjq20mswljj6a90uf8; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: temp_obj_load_turn
-- ALTER TABLE ONLY public.ic_application
--     ADD CONSTRAINT fk_66dhdflsjq20mswljj6a90uf8 FOREIGN KEY (temp_cont_turn) REFERENCES public.temp_obj_load_turn(id);


--
-- Name: corp_tech_application fk_67k9reih89vqke0nk6mqpwudd; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_client_type
-- ALTER TABLE ONLY public.corp_tech_application
--     ADD CONSTRAINT fk_67k9reih89vqke0nk6mqpwudd FOREIGN KEY (client_type_id) REFERENCES public.scp_dict_client_type(id);


--
-- Name: corp_tech_application fk_68l7axx3l5ny1by4ehvcupg29; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: price_formation
-- ALTER TABLE ONLY public.corp_tech_application
--     ADD CONSTRAINT fk_68l7axx3l5ny1by4ehvcupg29 FOREIGN KEY (pricing_id) REFERENCES public.price_formation(id);


--
-- Name: ic_application fk_68yu5lx5n0oyblnmci94w7lcr; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ic_application
    ADD CONSTRAINT fk_68yu5lx5n0oyblnmci94w7lcr FOREIGN KEY (app_obj_id) REFERENCES public.application_obj(id);


--
-- Name: scp_application fk_69kc84qc8kd6qdj4mun1eivlw; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_application
    ADD CONSTRAINT fk_69kc84qc8kd6qdj4mun1eivlw FOREIGN KEY (voting_km_id) REFERENCES public.sys_employee(id);


--
-- Name: mler_application fk_6a4yoh2t4nwvblry67bkwy1a0; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: draft_decision
-- ALTER TABLE ONLY public.mler_application
--     ADD CONSTRAINT fk_6a4yoh2t4nwvblry67bkwy1a0 FOREIGN KEY (project_decis_id) REFERENCES public.draft_decision(id);


--
-- Name: scp_amd_product fk_6rbhlvuplj5r13y7d0t8aou1u; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: currency
-- ALTER TABLE ONLY public.scp_amd_product
--     ADD CONSTRAINT fk_6rbhlvuplj5r13y7d0t8aou1u FOREIGN KEY (curr_loan_debt) REFERENCES public.currency(id);


--
-- Name: scp_sec_expertise fk_6sut4ktlbtu7mc9jaflms8vdb; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: ct_sec_check_res
-- ALTER TABLE ONLY public.scp_sec_expertise
--     ADD CONSTRAINT fk_6sut4ktlbtu7mc9jaflms8vdb FOREIGN KEY (ct_sec_check_res_id) REFERENCES public.ct_sec_check_res(id);


--
-- Name: credit_contract fk_6tjx4ky0bgxjxh8nuxebru61; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.credit_contract
    ADD CONSTRAINT fk_6tjx4ky0bgxjxh8nuxebru61 FOREIGN KEY (afp_state_id) REFERENCES public.sys_state(id);


--
-- Name: product_pricing fk_6v56etvjjry8rkg377ml6csh; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: price_formation
-- ALTER TABLE ONLY public.product_pricing
--     ADD CONSTRAINT fk_6v56etvjjry8rkg377ml6csh FOREIGN KEY (pricing_card_id) REFERENCES public.price_formation(id);


--
-- Name: scp_application fk_70x3dr1f5c2l9tx4lhy8j5aoo; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_application
    ADD CONSTRAINT fk_70x3dr1f5c2l9tx4lhy8j5aoo FOREIGN KEY (emp_id) REFERENCES public.sys_employee(id);


--
-- Name: sys_company fk_73lmaehsjvbbmglmkyaw2n0a6; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: customer_type
-- ALTER TABLE ONLY public.sys_company
--     ADD CONSTRAINT fk_73lmaehsjvbbmglmkyaw2n0a6 FOREIGN KEY (customer_type_id) REFERENCES public.customer_type(id);


--
-- Name: scp_application fk_752q7csl8w5dbdl2esnsji9l1; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_industry_code
-- ALTER TABLE ONLY public.scp_application
--     ADD CONSTRAINT fk_752q7csl8w5dbdl2esnsji9l1 FOREIGN KEY (industry_code_id) REFERENCES public.scp_dict_industry_code(id);


--
-- Name: sys_employee fk_77cagci853klbqa75xt66aiff; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: sex
-- ALTER TABLE ONLY public.sys_employee
--     ADD CONSTRAINT fk_77cagci853klbqa75xt66aiff FOREIGN KEY (sex_id) REFERENCES public.sex(id);


--
-- Name: ms_dxsh6488ihf77xmsd43dwby6k fk_79mkl8vgafp6kw0di7g3lis9w; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_dxsh6488ihf77xmsd43dwby6k
    ADD CONSTRAINT fk_79mkl8vgafp6kw0di7g3lis9w FOREIGN KEY (obj_id) REFERENCES public.sys_state(id);


--
-- Name: scp_project_ans fk_7a1rygibi8h9d0u6m6kb4pugq; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: clc_zones
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_7a1rygibi8h9d0u6m6kb4pugq FOREIGN KEY (clc_zone_id) REFERENCES public.clc_zones(id);


--
-- Name: corp_tech_application fk_7a9d5pxq75d9un8koxbm9nrrc; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_processing_steps
-- ALTER TABLE ONLY public.corp_tech_application
--     ADD CONSTRAINT fk_7a9d5pxq75d9un8koxbm9nrrc FOREIGN KEY (processing_steps_id) REFERENCES public.dict_processing_steps(id);


--
-- Name: sys_obj_resp fk_7ai1gyl2sxbq5976nj4rf5u77; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.sys_obj_resp
    ADD CONSTRAINT fk_7ai1gyl2sxbq5976nj4rf5u77 FOREIGN KEY (afe_ext_obj_id) REFERENCES public.sys_object(id);


--
-- Name: ms_64cm5ded37z58x0fyt5lgvhc7 fk_7bi4v1ydpwovgfci3f5vbaaxt; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_64cm5ded37z58x0fyt5lgvhc7
    ADD CONSTRAINT fk_7bi4v1ydpwovgfci3f5vbaaxt FOREIGN KEY (obj_id) REFERENCES public.offices_psb(id) ON DELETE CASCADE;


--
-- Name: prod_commissions fk_7bmoi7b3uymysekn1ynows2vw; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: comm_date_pay_dict
-- ALTER TABLE ONLY public.prod_commissions
--     ADD CONSTRAINT fk_7bmoi7b3uymysekn1ynows2vw FOREIGN KEY (comm_date_pay_id) REFERENCES public.comm_date_pay_dict(id);


--
-- Name: dict_product fk_7buo57fuxhrhqcj7cuwgsma8d; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: lending_type
-- ALTER TABLE ONLY public.dict_product
--     ADD CONSTRAINT fk_7buo57fuxhrhqcj7cuwgsma8d FOREIGN KEY (lending_type_id) REFERENCES public.lending_type(id);


--
-- Name: afhd_ac_trans_link fk_7cxdstxi4jogdmv3rg9lojaov; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: risk_form_inst
-- ALTER TABLE ONLY public.afhd_ac_trans_link
--     ADD CONSTRAINT fk_7cxdstxi4jogdmv3rg9lojaov FOREIGN KEY (form_inst_id) REFERENCES public.risk_form_inst(id);


--
-- Name: scp_project_ans fk_7e5d10jafkhywf81kv5x6hrak; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: clc_grades
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_7e5d10jafkhywf81kv5x6hrak FOREIGN KEY (clc_grade_id) REFERENCES public.clc_grades(id);


--
-- Name: prod_change_params fk_7f8o1duj736kif07lh28u5qlh; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: sum_pay_type_dict
-- ALTER TABLE ONLY public.prod_change_params
--     ADD CONSTRAINT fk_7f8o1duj736kif07lh28u5qlh FOREIGN KEY (sum_pay_type_id) REFERENCES public.sum_pay_type_dict(id);


--
-- Name: credit_contract fk_7fjbclq6d5j8osftlheki8vjg; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: app_pre_aprov_loan
-- ALTER TABLE ONLY public.credit_contract
--     ADD CONSTRAINT fk_7fjbclq6d5j8osftlheki8vjg FOREIGN KEY (aplication_id) REFERENCES public.app_pre_aprov_loan(id);


--
-- Name: scp_amd_product fk_7gt9j7tdkw8ps3p97strsmj2q; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_amd_product
    ADD CONSTRAINT fk_7gt9j7tdkw8ps3p97strsmj2q FOREIGN KEY (app_product_id) REFERENCES public.dict_product(id);


--
-- Name: count_turnover fk_7k3i1qwsg02shj3r4t9a6ol2p; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: risk_form_row_spr
-- ALTER TABLE ONLY public.count_turnover
--     ADD CONSTRAINT fk_7k3i1qwsg02shj3r4t9a6ol2p FOREIGN KEY (bb_debet_reclass_id) REFERENCES public.risk_form_row_spr(id);


--
-- Name: scp_dict_product_na fk_7knl2db3se3jhvdqwq6gjdb8n; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_dict_product_na
    ADD CONSTRAINT fk_7knl2db3se3jhvdqwq6gjdb8n FOREIGN KEY (app_product_id) REFERENCES public.dict_product(id);


--
-- Name: count_turnover fk_7mvba4bhf2ej2bba9ymgq192n; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.count_turnover
    ADD CONSTRAINT fk_7mvba4bhf2ej2bba9ymgq192n FOREIGN KEY (link_partic_gr) REFERENCES public.sys_object(id);


--
-- Name: scp_amd_product fk_7o3efgtvjvfc3clakpu83qo4e; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_amd_product
    ADD CONSTRAINT fk_7o3efgtvjvfc3clakpu83qo4e FOREIGN KEY (loan_type_id) REFERENCES public.type_loan(id);


--
-- Name: corp_tech_application fk_7pl3b2s2y9hfx0hsvkq6weh19; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.corp_tech_application
    ADD CONSTRAINT fk_7pl3b2s2y9hfx0hsvkq6weh19 FOREIGN KEY (deleg_region_id) REFERENCES public.dict_div_presence(id);


--
-- Name: credit_contract fk_7smodxry58friwxvs0guayou5; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_gos_program
-- ALTER TABLE ONLY public.credit_contract
--     ADD CONSTRAINT fk_7smodxry58friwxvs0guayou5 FOREIGN KEY (subsidy_prog_id) REFERENCES public.dict_gos_program(id);


--
-- Name: prod_commissions fk_7u6yplg9cmyx4naoa3i6bdopq; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.prod_commissions
    ADD CONSTRAINT fk_7u6yplg9cmyx4naoa3i6bdopq FOREIGN KEY (link_card_obj_id) REFERENCES public.sys_object(id);


--
-- Name: dict_product fk_7yll2cpwubhkmksp4lkiylrwi; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: collateral
-- ALTER TABLE ONLY public.dict_product
--     ADD CONSTRAINT fk_7yll2cpwubhkmksp4lkiylrwi FOREIGN KEY (collateral_id) REFERENCES public.collateral(id);


--
-- Name: ic_application fk_81j6905tkw7j0j6yi7mbs64cy; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ic_application
    ADD CONSTRAINT fk_81j6905tkw7j0j6yi7mbs64cy FOREIGN KEY (scp_arm_manager_id) REFERENCES public.sys_employee(id);


--
-- Name: dict_product fk_83lihr5tbk4hq1jp3o21brt79; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: payment_method
-- ALTER TABLE ONLY public.dict_product
--     ADD CONSTRAINT fk_83lihr5tbk4hq1jp3o21brt79 FOREIGN KEY (payment_method_id) REFERENCES public.payment_method(id);


--
-- Name: scp_sec_expertise fk_86gjkf9iauv52re2qtr39n90h; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_sec_expertise
    ADD CONSTRAINT fk_86gjkf9iauv52re2qtr39n90h FOREIGN KEY (app_obj_id) REFERENCES public.corp_tech_application(id);


--
-- Name: dict_product fk_892wjayw0wxcpeampfc2x0quo; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: penalty
-- ALTER TABLE ONLY public.dict_product
--     ADD CONSTRAINT fk_892wjayw0wxcpeampfc2x0quo FOREIGN KEY (forfeight_id) REFERENCES public.penalty(id);


--
-- Name: dict_product fk_898m5b2599iqmol4t8bj5tfs1; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: max_amount
-- ALTER TABLE ONLY public.dict_product
--     ADD CONSTRAINT fk_898m5b2599iqmol4t8bj5tfs1 FOREIGN KEY (max_amount_id) REFERENCES public.max_amount(id);


--
-- Name: ms_1fd5jp86pabxu9na4knwphvyr fk_8apo5tm8hvc29ydbyc92r4jen; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_1fd5jp86pabxu9na4knwphvyr
    ADD CONSTRAINT fk_8apo5tm8hvc29ydbyc92r4jen FOREIGN KEY (obj_id) REFERENCES public.dict_product(id);


--
-- Name: product_pricing fk_8b0se3w438y70y170p6g6yv6f; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_change_init
-- ALTER TABLE ONLY public.product_pricing
--     ADD CONSTRAINT fk_8b0se3w438y70y170p6g6yv6f FOREIGN KEY (change_initiator_id) REFERENCES public.scp_dict_change_init(id);


--
-- Name: scp_project_ans fk_8bghuaehq0m5d0rinkewtr46u; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_real_estate_class
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_8bghuaehq0m5d0rinkewtr46u FOREIGN KEY (real_estate_class_id) REFERENCES public.scp_real_estate_class(id);


--
-- Name: count_turnover fk_8cflfkhswqrjp2da6hgpf43o1; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: risk_form_row_spr
-- ALTER TABLE ONLY public.count_turnover
--     ADD CONSTRAINT fk_8cflfkhswqrjp2da6hgpf43o1 FOREIGN KEY (bb_cred_id) REFERENCES public.risk_form_row_spr(id);


--
-- Name: scp_part_sec_expertise fk_8ejmabsxsqucxnqdocqkj6c0o; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: sys_user
-- ALTER TABLE ONLY public.scp_part_sec_expertise
--     ADD CONSTRAINT fk_8ejmabsxsqucxnqdocqkj6c0o FOREIGN KEY (ses_conf_user_id) REFERENCES public.sys_user(id);


--
-- Name: corp_tech_application fk_8krgprvo7w6mnfshwqe6mpjji; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_type_req
-- ALTER TABLE ONLY public.corp_tech_application
--     ADD CONSTRAINT fk_8krgprvo7w6mnfshwqe6mpjji FOREIGN KEY (req_type_id) REFERENCES public.scp_dict_type_req(id);


--
-- Name: mler_application fk_8u4m1obsi877mtfe8yy2o3pxp; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_type_req
-- ALTER TABLE ONLY public.mler_application
--     ADD CONSTRAINT fk_8u4m1obsi877mtfe8yy2o3pxp FOREIGN KEY (req_type_id) REFERENCES public.scp_dict_type_req(id);


--
-- Name: prod_commissions fk_8ufmd11irrkjgm16nk0esrnmd; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: payment_schedule_dict
-- ALTER TABLE ONLY public.prod_commissions
--     ADD CONSTRAINT fk_8ufmd11irrkjgm16nk0esrnmd FOREIGN KEY (payment_schedule_id) REFERENCES public.payment_schedule_dict(id);


--
-- Name: scp_amd_product fk_96e056xx4k3lyyjxu8g1acvkf; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: client_group_dict
-- ALTER TABLE ONLY public.scp_amd_product
--     ADD CONSTRAINT fk_96e056xx4k3lyyjxu8g1acvkf FOREIGN KEY (cl_group_id) REFERENCES public.client_group_dict(id);


--
-- Name: ic_application fk_96t8tkw88kymlh25tw79h6sk3; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_processing_steps
-- ALTER TABLE ONLY public.ic_application
--     ADD CONSTRAINT fk_96t8tkw88kymlh25tw79h6sk3 FOREIGN KEY (processing_steps_id) REFERENCES public.dict_processing_steps(id);


--
-- Name: corp_tech_application fk_9cmp7oor11uw80ax409neqt81; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_scp_risk_zone
-- ALTER TABLE ONLY public.corp_tech_application
--     ADD CONSTRAINT fk_9cmp7oor11uw80ax409neqt81 FOREIGN KEY (risk_zone_id) REFERENCES public.dict_scp_risk_zone(id);


--
-- Name: scp_collateral_app fk_9dg6cwjuujn7u96qc9p64qv6b; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_coll_appl_type
-- ALTER TABLE ONLY public.scp_collateral_app
--     ADD CONSTRAINT fk_9dg6cwjuujn7u96qc9p64qv6b FOREIGN KEY (coll_appl_type_id) REFERENCES public.scp_dict_coll_appl_type(id);


--
-- Name: prod_change_params fk_9ewehetyfsabhs75tbcei7ky1; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.prod_change_params
    ADD CONSTRAINT fk_9ewehetyfsabhs75tbcei7ky1 FOREIGN KEY (link_card_obj_id) REFERENCES public.sys_object(id);


--
-- Name: scp_sec_check_res fk_9fi67gt91o216l93c3qc41yk1; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_scp_risk_zone
-- ALTER TABLE ONLY public.scp_sec_check_res
--     ADD CONSTRAINT fk_9fi67gt91o216l93c3qc41yk1 FOREIGN KEY (aspr_zone_id) REFERENCES public.dict_scp_risk_zone(id);


--
-- Name: participant_app fk_9irp11r53a2ojp3y624trrvbd; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_type_participant
-- ALTER TABLE ONLY public.participant_app
--     ADD CONSTRAINT fk_9irp11r53a2ojp3y624trrvbd FOREIGN KEY (part_type_id) REFERENCES public.scp_type_participant(id);


--
-- Name: scp_amd_product fk_9kwou44ukrld2wl87odsii8t3; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: clc_zones
-- ALTER TABLE ONLY public.scp_amd_product
--     ADD CONSTRAINT fk_9kwou44ukrld2wl87odsii8t3 FOREIGN KEY (clc_zone_id) REFERENCES public.clc_zones(id);


--
-- Name: scp_sec_expertise fk_9p55i1dnv6v2s40vo8s0dkfyo; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_sec_expertise
    ADD CONSTRAINT fk_9p55i1dnv6v2s40vo8s0dkfyo FOREIGN KEY (deleg_emp_id) REFERENCES public.sys_employee(id);


--
-- Name: scp_decision_quest fk_9sjj3j1rq7rqib65nxl5us10q; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_decision_quest
    ADD CONSTRAINT fk_9sjj3j1rq7rqib65nxl5us10q FOREIGN KEY (app_product_id) REFERENCES public.dict_product(id);


--
-- Name: ic_application fk_9svs4or9dt6ioefaldb60unb5; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: price_formation
-- ALTER TABLE ONLY public.ic_application
--     ADD CONSTRAINT fk_9svs4or9dt6ioefaldb60unb5 FOREIGN KEY (pricing_id) REFERENCES public.price_formation(id);


--
-- Name: sys_employee fk_9tqn9gndl78gn410pcc9tjw0l; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: sys_city
-- ALTER TABLE ONLY public.sys_employee
--     ADD CONSTRAINT fk_9tqn9gndl78gn410pcc9tjw0l FOREIGN KEY (city_id) REFERENCES public.sys_city(id);


--
-- Name: scp_sec_expertise fk_9w1793escpmrp5pmqxevsasy6; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_sec_expertise
    ADD CONSTRAINT fk_9w1793escpmrp5pmqxevsasy6 FOREIGN KEY (psb_office_id) REFERENCES public.offices_psb(id);


--
-- Name: afhd_ac_trans_link fk_a1gbg6l11tq2r8hmfhsw5ja68; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: link_calc_turn_log
-- ALTER TABLE ONLY public.afhd_ac_trans_link
--     ADD CONSTRAINT fk_a1gbg6l11tq2r8hmfhsw5ja68 FOREIGN KEY (link_calc_turn_log_id) REFERENCES public.link_calc_turn_log(id);


--
-- Name: ms_dxsh6488ihf77xmsd43dwby6k fk_a5i48b63rg91dnlel9mquxe2j; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_dxsh6488ihf77xmsd43dwby6k
    ADD CONSTRAINT fk_a5i48b63rg91dnlel9mquxe2j FOREIGN KEY (id) REFERENCES public.scp_application(id);


--
-- Name: scp_prod_comm_dict fk_a8cy3nmc9oo90o1ap8jscylnw; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: payment_schedule_dict
-- ALTER TABLE ONLY public.scp_prod_comm_dict
--     ADD CONSTRAINT fk_a8cy3nmc9oo90o1ap8jscylnw FOREIGN KEY (payment_schedule_id) REFERENCES public.payment_schedule_dict(id);


--
-- Name: ic_application fk_a9xfelvpvcovwxftp6hfgh8na; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ic_application
    ADD CONSTRAINT fk_a9xfelvpvcovwxftp6hfgh8na FOREIGN KEY (credit_logic_id) REFERENCES public.scp_techcred(id);


--
-- Name: scp_prod_comm_dict fk_aauu3kyft3wkpjq6cudrejnno; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: gov_prog_value_dict
-- ALTER TABLE ONLY public.scp_prod_comm_dict
--     ADD CONSTRAINT fk_aauu3kyft3wkpjq6cudrejnno FOREIGN KEY (gov_prog_value) REFERENCES public.gov_prog_value_dict(id);


--
-- Name: afhd_ac_trans_link fk_adjshmhb7pl5lrh42cbiw32wq; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.afhd_ac_trans_link
    ADD CONSTRAINT fk_adjshmhb7pl5lrh42cbiw32wq FOREIGN KEY (account_num_id) REFERENCES public.acc_number(id);


--
-- Name: scp_project_ans fk_ahjqwr7eiphbatdemh2duln29; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_project_ans
    ADD CONSTRAINT fk_ahjqwr7eiphbatdemh2duln29 FOREIGN KEY (credit_analyst_id) REFERENCES public.sys_employee(id);


--
-- Name: scp_collateral_app fk_ai1kfwqf9c6ospn6f45citecq; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_collateral_app
    ADD CONSTRAINT fk_ai1kfwqf9c6ospn6f45citecq FOREIGN KEY (cp_arm_manager_id) REFERENCES public.sys_employee(id);


--
-- Name: acc_number fk_aidq839hf0qa0hd366aliajgp; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.acc_number
    ADD CONSTRAINT fk_aidq839hf0qa0hd366aliajgp FOREIGN KEY (parent_acc) REFERENCES public.acc_number(id);


--
-- Name: scp_decision_quest fk_aiitlkpe3r6v8ew59d92qdy1d; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: product_compound_dict
-- ALTER TABLE ONLY public.scp_decision_quest
--     ADD CONSTRAINT fk_aiitlkpe3r6v8ew59d92qdy1d FOREIGN KEY (product_compound_id) REFERENCES public.product_compound_dict(id);


--
-- Name: afhd_ac_trans_link fk_am4b4liw21uyupnkadkbibah9; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_comp_sign
-- ALTER TABLE ONLY public.afhd_ac_trans_link
--     ADD CONSTRAINT fk_am4b4liw21uyupnkadkbibah9 FOREIGN KEY (comp_sign_id) REFERENCES public.dict_comp_sign(id);


--
-- Name: sys_obj_resp fk_amf5d5eq6iim32bu6s9oqx9f7; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.sys_obj_resp
    ADD CONSTRAINT fk_amf5d5eq6iim32bu6s9oqx9f7 FOREIGN KEY (afe_obj_id) REFERENCES public.sys_object(id);


--
-- Name: offices_psb fk_ao19vf7462msbiu7i0u96umtn; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.offices_psb
    ADD CONSTRAINT fk_ao19vf7462msbiu7i0u96umtn FOREIGN KEY (rout_office_id) REFERENCES public.offices_psb(id);


--
-- Name: scp_collateral_app fk_aov0iuwio5qw6t6rhwvclinvu; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_app_status
-- ALTER TABLE ONLY public.scp_collateral_app
--     ADD CONSTRAINT fk_aov0iuwio5qw6t6rhwvclinvu FOREIGN KEY (appl_state_id) REFERENCES public.dict_app_status(id);


--
-- Name: scp_application fk_apg0o7s0ful636diod143n6gb; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: spr_yes_no
-- ALTER TABLE ONLY public.scp_application
--     ADD CONSTRAINT fk_apg0o7s0ful636diod143n6gb FOREIGN KEY (is_not_red_zone) REFERENCES public.spr_yes_no(id);


--
-- Name: scp_amd_product fk_apjm9vdv2hqgfom5ek3g2w39a; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: type_payments
-- ALTER TABLE ONLY public.scp_amd_product
--     ADD CONSTRAINT fk_apjm9vdv2hqgfom5ek3g2w39a FOREIGN KEY (repayment_type_id) REFERENCES public.type_payments(id);


--
-- Name: dict_product fk_apxjjhp88n52lpsjxky3cswt0; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.dict_product
    ADD CONSTRAINT fk_apxjjhp88n52lpsjxky3cswt0 FOREIGN KEY (attr_business_segment) REFERENCES public.business_segment(id);


--
-- Name: dict_product fk_atknbd6cv4h6us07cawqeoxh7; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: interest_penalties
-- ALTER TABLE ONLY public.dict_product
--     ADD CONSTRAINT fk_atknbd6cv4h6us07cawqeoxh7 FOREIGN KEY (interest_penalties_id) REFERENCES public.interest_penalties(id);


--
-- Name: sys_obj_resp fk_atq4l95jp3gnce480kt5rvtx5; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: sys_sec_subject
-- ALTER TABLE ONLY public.sys_obj_resp
--     ADD CONSTRAINT fk_atq4l95jp3gnce480kt5rvtx5 FOREIGN KEY (afe_subject_id) REFERENCES public.sys_sec_subject(id);


--
-- Name: scp_project_ans fk_b1j10iuxw52igrpj5d67ph2pu; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_project_ans
    ADD CONSTRAINT fk_b1j10iuxw52igrpj5d67ph2pu FOREIGN KEY (voting_rm_id) REFERENCES public.sys_employee(id);


--
-- Name: scp_amd_product fk_b1wqv7h2th06n02oj67hn2q7k; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: currency
-- ALTER TABLE ONLY public.scp_amd_product
--     ADD CONSTRAINT fk_b1wqv7h2th06n02oj67hn2q7k FOREIGN KEY (scp_sublimit_val) REFERENCES public.currency(id);


--
-- Name: scp_amd_product fk_b3o5x8rmp5y6it0v60n5gdfx1; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_allowed_notallowed
-- ALTER TABLE ONLY public.scp_amd_product
--     ADD CONSTRAINT fk_b3o5x8rmp5y6it0v60n5gdfx1 FOREIGN KEY (blanc_deal_asmt_result) REFERENCES public.dict_allowed_notallowed(id);


--
-- Name: sys_obj_type fk_b4ubcallhwi8l8jly0w5m0i3v; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: sys_alg_card
-- ALTER TABLE ONLY public.sys_obj_type
--     ADD CONSTRAINT fk_b4ubcallhwi8l8jly0w5m0i3v FOREIGN KEY (alg_deleting_id) REFERENCES public.sys_alg_card(id);


--
-- Name: scp_sec_check_res fk_b5ck006o2y51s491lpddb8c2s; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: fs_app_aspr_route
-- ALTER TABLE ONLY public.scp_sec_check_res
--     ADD CONSTRAINT fk_b5ck006o2y51s491lpddb8c2s FOREIGN KEY (aspr_route_id) REFERENCES public.fs_app_aspr_route(id);


--
-- Name: scp_project_ans fk_b8sucbaajg1bvtu0km39ft3nx; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_type_restruct
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_b8sucbaajg1bvtu0km39ft3nx FOREIGN KEY (scp_type_restruct_id) REFERENCES public.scp_dict_type_restruct(id);


--
-- Name: application_obj fk_b9kvygpfcjikpgt4u7loxqo9e; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: afhd_gsl_calc_cont
-- ALTER TABLE ONLY public.application_obj
--     ADD CONSTRAINT fk_b9kvygpfcjikpgt4u7loxqo9e FOREIGN KEY (prelim_gsl_calc_id) REFERENCES public.afhd_gsl_calc_cont(id);


--
-- Name: ms_9k60rv4p0oaf3c702f2l1gj77 fk_bbayxn6q15jt803kxvamb9epf; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_9k60rv4p0oaf3c702f2l1gj77
    ADD CONSTRAINT fk_bbayxn6q15jt803kxvamb9epf FOREIGN KEY (id) REFERENCES public.scp_gov_program_dict(id);


--
-- Name: scp_amd_product fk_bd68duhf18w64opkeajgo2x4v; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: quest_structure
-- ALTER TABLE ONLY public.scp_amd_product
--     ADD CONSTRAINT fk_bd68duhf18w64opkeajgo2x4v FOREIGN KEY (scp_prod_quest_id) REFERENCES public.quest_structure(id);


--
-- Name: ms_39qrctc1n8efr9axiukjssgzl fk_beeikyx21bqu8mgyh2evsmlit; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_39qrctc1n8efr9axiukjssgzl
    ADD CONSTRAINT fk_beeikyx21bqu8mgyh2evsmlit FOREIGN KEY (id) REFERENCES public.scp_prod_comm_dict(id);


--
-- Name: scp_amd_product fk_bg7bvl4hve3jqf7i37roca7y; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: afhd_contract_holder
-- ALTER TABLE ONLY public.scp_amd_product
--     ADD CONSTRAINT fk_bg7bvl4hve3jqf7i37roca7y FOREIGN KEY (contr_cont_id) REFERENCES public.afhd_contract_holder(id);


--
-- Name: scp_project_ans fk_bi6er2vhchyb0u5r2a1pkyba4; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_project_ans
    ADD CONSTRAINT fk_bi6er2vhchyb0u5r2a1pkyba4 FOREIGN KEY (spec_fa) REFERENCES public.sys_employee(id);


--
-- Name: type_loan fk_brwy26irsr4udnje01g7g5j9u; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: prod_type_upp_lev
-- ALTER TABLE ONLY public.type_loan
--     ADD CONSTRAINT fk_brwy26irsr4udnje01g7g5j9u FOREIGN KEY (prod_type_upp_lev_id) REFERENCES public.prod_type_upp_lev(id);


--
-- Name: corp_tech_application fk_btb4ykpq8nw28uc8od4u162h0; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_head_cm_decision
-- ALTER TABLE ONLY public.corp_tech_application
--     ADD CONSTRAINT fk_btb4ykpq8nw28uc8od4u162h0 FOREIGN KEY (scp_hcm_decision_id) REFERENCES public.scp_head_cm_decision(id);


--
-- Name: afhd_ac_trans_link fk_btc9nedv1xs4br64i9i74qvo1; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: sys_company_gsl
-- ALTER TABLE ONLY public.afhd_ac_trans_link
--     ADD CONSTRAINT fk_btc9nedv1xs4br64i9i74qvo1 FOREIGN KEY (link_cnt) REFERENCES public.sys_company_gsl(id);


--
-- Name: scp_decision_quest fk_btip14e6r9f5vldm72tohug9s; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_source_fininancing
-- ALTER TABLE ONLY public.scp_decision_quest
--     ADD CONSTRAINT fk_btip14e6r9f5vldm72tohug9s FOREIGN KEY (source_financing_id) REFERENCES public.dict_source_fininancing(id);


--
-- Name: sys_obj_type fk_bvwcve18uw6po0x39p0xm3r9c; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.sys_obj_type
    ADD CONSTRAINT fk_bvwcve18uw6po0x39p0xm3r9c FOREIGN KEY (parent_id) REFERENCES public.sys_obj_type(id);


--
-- Name: sys_company fk_bxdw96a5gyr99iejednimuwy7; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: general_activity_guide
-- ALTER TABLE ONLY public.sys_company
--     ADD CONSTRAINT fk_bxdw96a5gyr99iejednimuwy7 FOREIGN KEY (fo_okved) REFERENCES public.general_activity_guide(id);


--
-- Name: sys_company fk_bxs5g8ikpceh028x0jt46rsv5; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.sys_company
    ADD CONSTRAINT fk_bxs5g8ikpceh028x0jt46rsv5 FOREIGN KEY (offices_psb_id) REFERENCES public.offices_psb(id);


--
-- Name: ic_application fk_by97bsn2w39tefpjjd5igdnpa; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ic_application
    ADD CONSTRAINT fk_by97bsn2w39tefpjjd5igdnpa FOREIGN KEY (deleg_region_id) REFERENCES public.dict_div_presence(id);


--
-- Name: product_pricing fk_c07ngt07uc3e5nlig8ce5x432; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: client_group_dict
-- ALTER TABLE ONLY public.product_pricing
--     ADD CONSTRAINT fk_c07ngt07uc3e5nlig8ce5x432 FOREIGN KEY (cl_group_id) REFERENCES public.client_group_dict(id);


--
-- Name: scp_amd_product fk_c2caeoruus3j0bg4iv7g08qgt; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_amd_product
    ADD CONSTRAINT fk_c2caeoruus3j0bg4iv7g08qgt FOREIGN KEY (test_amd_proj_link) REFERENCES public.scp_project_ans(id);


--
-- Name: credit_contract fk_c80fp4nbicgxno2923e00gwgu; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.credit_contract
    ADD CONSTRAINT fk_c80fp4nbicgxno2923e00gwgu FOREIGN KEY (link_customer_id) REFERENCES public.sys_company(id);


--
-- Name: count_turnover fk_cbe3bt6yb2g3yusam1h85ag6r; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: risk_form_row_spr
-- ALTER TABLE ONLY public.count_turnover
--     ADD CONSTRAINT fk_cbe3bt6yb2g3yusam1h85ag6r FOREIGN KEY (bb_cred_input_id) REFERENCES public.risk_form_row_spr(id);


--
-- Name: ic_application fk_cctfln62482hqw95qju2w3yyx; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ic_application
    ADD CONSTRAINT fk_cctfln62482hqw95qju2w3yyx FOREIGN KEY (initiator_id) REFERENCES public.sys_object(id);


--
-- Name: scp_project_ans fk_ckwsak1al5awhh17ugg6enpij; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_loan_sign
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_ckwsak1al5awhh17ugg6enpij FOREIGN KEY (scp_loan_sign_id) REFERENCES public.scp_loan_sign(id);


--
-- Name: scp_sec_check_res fk_cl67hvaiosx6o662qef546hw4; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: fs_affil_res_dict
-- ALTER TABLE ONLY public.scp_sec_check_res
--     ADD CONSTRAINT fk_cl67hvaiosx6o662qef546hw4 FOREIGN KEY (aspr_affil_res_id) REFERENCES public.fs_affil_res_dict(id);


--
-- Name: yaig_client_guarantee fk_coug8swfn1va1tjyis3d48tvo; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: yaig_client_principal
-- ALTER TABLE ONLY public.yaig_client_guarantee
--     ADD CONSTRAINT fk_coug8swfn1va1tjyis3d48tvo FOREIGN KEY (yaig_client_princip_id) REFERENCES public.yaig_client_principal(id);


--
-- Name: product_pricing fk_cq1w7qrw7umpxl68p44vh5tly; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.product_pricing
    ADD CONSTRAINT fk_cq1w7qrw7umpxl68p44vh5tly FOREIGN KEY (product_pricing_id) REFERENCES public.product_pricing(id);


--
-- Name: count_turnover fk_cr3c2jfx2ytd29c74ckbmc38c; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.count_turnover
    ADD CONSTRAINT fk_cr3c2jfx2ytd29c74ckbmc38c FOREIGN KEY (link_cred_doc_tur) REFERENCES public.sys_object(id);


--
-- Name: ic_application fk_crlwcr26bo9blroy0whajoaia; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_industry_code
-- ALTER TABLE ONLY public.ic_application
--     ADD CONSTRAINT fk_crlwcr26bo9blroy0whajoaia FOREIGN KEY (industry_code_id) REFERENCES public.scp_dict_industry_code(id);


--
-- Name: credit_contract fk_cs91dpc57e7q9krk914k6ilcs; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: currency
-- ALTER TABLE ONLY public.credit_contract
--     ADD CONSTRAINT fk_cs91dpc57e7q9krk914k6ilcs FOREIGN KEY (sel_curr) REFERENCES public.currency(id);


--
-- Name: ic_application fk_csb4cysxxb0qowje25jg79fim; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ic_application
    ADD CONSTRAINT fk_csb4cysxxb0qowje25jg79fim FOREIGN KEY (curator_head_id) REFERENCES public.sys_employee(id);


--
-- Name: dict_product fk_d3f3oqxwrbkpdk1gk1d1l3nrt; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: payment_commission
-- ALTER TABLE ONLY public.dict_product
--     ADD CONSTRAINT fk_d3f3oqxwrbkpdk1gk1d1l3nrt FOREIGN KEY (payment_commission_id) REFERENCES public.payment_commission(id);


--
-- Name: tbs_type fk_d8ytx334erst35mb2l5osdl3c; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_tbs_type_short
-- ALTER TABLE ONLY public.tbs_type
--     ADD CONSTRAINT fk_d8ytx334erst35mb2l5osdl3c FOREIGN KEY (acc_subconto_type_id) REFERENCES public.dict_tbs_type_short(id);


--
-- Name: dict_product fk_davb9psn7u620x20yeggsntjo; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: guarantee
-- ALTER TABLE ONLY public.dict_product
--     ADD CONSTRAINT fk_davb9psn7u620x20yeggsntjo FOREIGN KEY (guarantee_id) REFERENCES public.guarantee(id);


--
-- Name: scp_amd_product fk_daxlx9nia3x9ue9rrn46vvgy2; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_amd_product
    ADD CONSTRAINT fk_daxlx9nia3x9ue9rrn46vvgy2 FOREIGN KEY (draft_dec_id) REFERENCES public.scp_decision_quest(id);


--
-- Name: application_obj fk_dbdi9wpj68d24pad5enx7l4qe; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.application_obj
    ADD CONSTRAINT fk_dbdi9wpj68d24pad5enx7l4qe FOREIGN KEY (afp_state_id) REFERENCES public.sys_state(id);


--
-- Name: ms_d1oakp9uq175ak3dbhpzbu81d fk_djx70nbdxx0b4im5lm973hgxf; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_d1oakp9uq175ak3dbhpzbu81d
    ADD CONSTRAINT fk_djx70nbdxx0b4im5lm973hgxf FOREIGN KEY (id) REFERENCES public.application_obj(id);


--
-- Name: corp_tech_application fk_dm51ijqaua1cdu5dctsg3woci; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_proc_steps_dict
-- ALTER TABLE ONLY public.corp_tech_application
--     ADD CONSTRAINT fk_dm51ijqaua1cdu5dctsg3woci FOREIGN KEY (scp_proc_steds_id) REFERENCES public.scp_proc_steps_dict(id);


--
-- Name: yaig_client_gen_agr fk_dmgljb6j2unu34dd1eltvye0b; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: currency
-- ALTER TABLE ONLY public.yaig_client_gen_agr
--     ADD CONSTRAINT fk_dmgljb6j2unu34dd1eltvye0b FOREIGN KEY (yaig_cur_id) REFERENCES public.currency(id);


--
-- Name: credit_contract fk_dopeit2s9qg1deuynru1wbemj; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: pledge_contract
-- ALTER TABLE ONLY public.credit_contract
--     ADD CONSTRAINT fk_dopeit2s9qg1deuynru1wbemj FOREIGN KEY (pledge_contract_id) REFERENCES public.pledge_contract(id);


--
-- Name: scp_project_ans fk_dqi8i9xsa658hxo1ev9ukikcf; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_project_ans
    ADD CONSTRAINT fk_dqi8i9xsa658hxo1ev9ukikcf FOREIGN KEY (voting_fm_id) REFERENCES public.sys_employee(id);


--
-- Name: scp_gov_program_dict fk_dscxexv652m3hsuk5hm1it4oi; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_gov_program_dict
    ADD CONSTRAINT fk_dscxexv652m3hsuk5hm1it4oi FOREIGN KEY (upp_gov_prog_dict_id) REFERENCES public.scp_gov_program_dict(id);


--
-- Name: scp_application fk_dw2vod7vrtcvq9qgrmvmu9q0q; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: credit_report
-- ALTER TABLE ONLY public.scp_application
--     ADD CONSTRAINT fk_dw2vod7vrtcvq9qgrmvmu9q0q FOREIGN KEY (cr_id) REFERENCES public.credit_report(id);


--
-- Name: scp_application fk_e01akd3dy3a12m2rb0jy80n7o; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_application
    ADD CONSTRAINT fk_e01akd3dy3a12m2rb0jy80n7o FOREIGN KEY (scp_cheif_cm_id) REFERENCES public.sys_employee(id);


--
-- Name: afhd_ac_trans_link fk_e03u89xld8uns7mu72xah5e4y; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: risk_form_part_spr
-- ALTER TABLE ONLY public.afhd_ac_trans_link
--     ADD CONSTRAINT fk_e03u89xld8uns7mu72xah5e4y FOREIGN KEY (form_section_id) REFERENCES public.risk_form_part_spr(id);


--
-- Name: scp_decision_quest fk_e20mirjamj2xhtky43v7jyyx2; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_decision_quest
    ADD CONSTRAINT fk_e20mirjamj2xhtky43v7jyyx2 FOREIGN KEY (loan_type_id) REFERENCES public.type_loan(id);


--
-- Name: corp_tech_application fk_e2lpku1myp6gqdpnt37mw7ibb; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.corp_tech_application
    ADD CONSTRAINT fk_e2lpku1myp6gqdpnt37mw7ibb FOREIGN KEY (credit_logic_id) REFERENCES public.scp_techcred(id);


--
-- Name: afhd_ac_trans_link fk_e3ot0yt9ffyglhc5u5as74lpe; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: account_fields_51
-- ALTER TABLE ONLY public.afhd_ac_trans_link
--     ADD CONSTRAINT fk_e3ot0yt9ffyglhc5u5as74lpe FOREIGN KEY (transaction_id) REFERENCES public.account_fields_51(id);


--
-- Name: scp_sec_expertise fk_e982c7jni57abhgsgfnvedg31; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_sec_expertise
    ADD CONSTRAINT fk_e982c7jni57abhgsgfnvedg31 FOREIGN KEY (expertise_obj_id) REFERENCES public.application_obj(id);


--
-- Name: ms_0n8ohjyx7oszo6a47ca9g0s6f fk_e9r51rqo5fgxg1yigusjl5l2w; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_0n8ohjyx7oszo6a47ca9g0s6f
    ADD CONSTRAINT fk_e9r51rqo5fgxg1yigusjl5l2w FOREIGN KEY (obj_id) REFERENCES public.sys_state(id) ON DELETE CASCADE;


--
-- Name: scp_prod_guar_dict fk_ea6vbd4fnvohh0k318skqw8gb; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_prod_guar_dict
    ADD CONSTRAINT fk_ea6vbd4fnvohh0k318skqw8gb FOREIGN KEY (prod_guarant_dict_id) REFERENCES public.scp_prod_guarant_dict(id);


--
-- Name: scp_application fk_ec7ft6ur64dxuk3qq22j84khl; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: price_formation
-- ALTER TABLE ONLY public.scp_application
--     ADD CONSTRAINT fk_ec7ft6ur64dxuk3qq22j84khl FOREIGN KEY (pricing_id) REFERENCES public.price_formation(id);


--
-- Name: scp_sec_check_res fk_ed7xlvrci15tfxivtxub9ddod; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: sf_suppl_check_dict
-- ALTER TABLE ONLY public.scp_sec_check_res
--     ADD CONSTRAINT fk_ed7xlvrci15tfxivtxub9ddod FOREIGN KEY (supp_check_res_id) REFERENCES public.sf_suppl_check_dict(id);


--
-- Name: scp_amd_product fk_edryxrb5er6dgbqmayqlinq1u; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_type_gov_prog
-- ALTER TABLE ONLY public.scp_amd_product
--     ADD CONSTRAINT fk_edryxrb5er6dgbqmayqlinq1u FOREIGN KEY (comp_type_gov_prog_id) REFERENCES public.scp_type_gov_prog(id);


--
-- Name: count_turnover fk_eg6mwb8f12yw0kyfjcvi15q47; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.count_turnover
    ADD CONSTRAINT fk_eg6mwb8f12yw0kyfjcvi15q47 FOREIGN KEY (account_num_id) REFERENCES public.acc_number(id);


--
-- Name: application_obj fk_ehn5ahdo0u1wen7g2ywwvsaqy; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.application_obj
    ADD CONSTRAINT fk_ehn5ahdo0u1wen7g2ywwvsaqy FOREIGN KEY (scp_tech_ctredit) REFERENCES public.scp_dict_tech_ctredit(id);


--
-- Name: scp_project_ans fk_ei6a460weativc39h3ch043tu; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: general_activity_guide
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_ei6a460weativc39h3ch043tu FOREIGN KEY (okved_activity_id) REFERENCES public.general_activity_guide(id);


--
-- Name: sys_employee fk_eijowmh7me3kf2d44ins8yn1i; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.sys_employee
    ADD CONSTRAINT fk_eijowmh7me3kf2d44ins8yn1i FOREIGN KEY (sys_image) REFERENCES public.fs_file(id);


--
-- Name: scp_decision_quest fk_eirhk0nx2do2thagbj14dgqql; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: currency
-- ALTER TABLE ONLY public.scp_decision_quest
--     ADD CONSTRAINT fk_eirhk0nx2do2thagbj14dgqql FOREIGN KEY (scp_sublimit_val) REFERENCES public.currency(id);


--
-- Name: yaig_client_guarantee fk_eiw1v2hle0sley1kb33fioi84; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.yaig_client_guarantee
    ADD CONSTRAINT fk_eiw1v2hle0sley1kb33fioi84 FOREIGN KEY (yaig_client_link) REFERENCES public.sys_company(id);


--
-- Name: prod_guarantees fk_ejr1vbkc7wbdep9u9qq9r34ik; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.prod_guarantees
    ADD CONSTRAINT fk_ejr1vbkc7wbdep9u9qq9r34ik FOREIGN KEY (link_card_obj_id) REFERENCES public.sys_object(id);


--
-- Name: scp_sec_expertise fk_ekrvb5dxsm7968a2q97vu6nau; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_sec_expertise
    ADD CONSTRAINT fk_ekrvb5dxsm7968a2q97vu6nau FOREIGN KEY (deleg_region_id) REFERENCES public.dict_div_presence(id);


--
-- Name: scp_project_ans fk_ewnuhsuib2v674wsf5b1b04oy; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_project_ans
    ADD CONSTRAINT fk_ewnuhsuib2v674wsf5b1b04oy FOREIGN KEY (scp_subl_bor) REFERENCES public.sys_company(id);


--
-- Name: sys_company fk_f1e8wa38st1eyt29snra8dq9o; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: business_segment_dict
-- ALTER TABLE ONLY public.sys_company
--     ADD CONSTRAINT fk_f1e8wa38st1eyt29snra8dq9o FOREIGN KEY (busines_segment_id) REFERENCES public.business_segment_dict(id);


--
-- Name: corp_tech_application fk_f6s0pmhp71oscugreg5u8vlac; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.corp_tech_application
    ADD CONSTRAINT fk_f6s0pmhp71oscugreg5u8vlac FOREIGN KEY (iniciator_emp_id) REFERENCES public.sys_employee(id);


--
-- Name: scp_decision_quest fk_f86jdgcp2vsaev4rr2q4nkyfn; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: quest_structure
-- ALTER TABLE ONLY public.scp_decision_quest
--     ADD CONSTRAINT fk_f86jdgcp2vsaev4rr2q4nkyfn FOREIGN KEY (copy_source_quest_id) REFERENCES public.quest_structure(id);


--
-- Name: scp_amd_product fk_f90olvg6ht70oakt8ofn7at32; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: product_risk_asses
-- ALTER TABLE ONLY public.scp_amd_product
--     ADD CONSTRAINT fk_f90olvg6ht70oakt8ofn7at32 FOREIGN KEY (product_risk_asses_id) REFERENCES public.product_risk_asses(id);


--
-- Name: scp_sec_expertise fk_faa3me5jy22o6epynu0ib2axm; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_scp_risk_zone
-- ALTER TABLE ONLY public.scp_sec_expertise
--     ADD CONSTRAINT fk_faa3me5jy22o6epynu0ib2axm FOREIGN KEY (risk_zone_id) REFERENCES public.dict_scp_risk_zone(id);


--
-- Name: prod_change_params fk_fbvtxelh0074pkhd56px9q9h8; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: pay_reward_cond_dict
-- ALTER TABLE ONLY public.prod_change_params
--     ADD CONSTRAINT fk_fbvtxelh0074pkhd56px9q9h8 FOREIGN KEY (new_pay_reward_cond_id) REFERENCES public.pay_reward_cond_dict(id);


--
-- Name: scp_project_ans fk_fj34pkm5klr08fnxc63buyd2r; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: undwrt_decis_level_dict
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_fj34pkm5klr08fnxc63buyd2r FOREIGN KEY (rm_ra_decis_level_id) REFERENCES public.undwrt_decis_level_dict(id);


--
-- Name: scp_dict_product_na fk_fkmhniw36h8hi31xle7u8l75w; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_dict_product_na
    ADD CONSTRAINT fk_fkmhniw36h8hi31xle7u8l75w FOREIGN KEY (yaig_product_id) REFERENCES public.yaig_product_dict(id);


--
-- Name: participant_app fk_fl47h2rglvkkgn0ecaes78lu3; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.participant_app
    ADD CONSTRAINT fk_fl47h2rglvkkgn0ecaes78lu3 FOREIGN KEY (app_obj_person_conn_id) REFERENCES public.application_obj(id);


--
-- Name: scp_project_ans fk_flbbi6d47s0f7fum8jgtpq0fi; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_project_ans
    ADD CONSTRAINT fk_flbbi6d47s0f7fum8jgtpq0fi FOREIGN KEY (state_id) REFERENCES public.sys_state(id);


--
-- Name: participant_app fk_fnbu2x0i1erbhtnb1e6e2534t; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.participant_app
    ADD CONSTRAINT fk_fnbu2x0i1erbhtnb1e6e2534t FOREIGN KEY (app_obj_id) REFERENCES public.application_obj(id);


--
-- Name: scp_application fk_frpnbchofbiqbtj0k8b22l2ry; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_application
    ADD CONSTRAINT fk_frpnbchofbiqbtj0k8b22l2ry FOREIGN KEY (lending_tech_id) REFERENCES public.scp_dict_tech_ctredit(id);


--
-- Name: corp_tech_application fk_ft0xp12q9pl7y1t39resgl1t; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.corp_tech_application
    ADD CONSTRAINT fk_ft0xp12q9pl7y1t39resgl1t FOREIGN KEY (exp_fa_office_id) REFERENCES public.offices_psb(id);


--
-- Name: sys_obj_type fk_fv3910qmq1mlxv3grdgnlq0lr; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: sys_content_type
-- ALTER TABLE ONLY public.sys_obj_type
--     ADD CONSTRAINT fk_fv3910qmq1mlxv3grdgnlq0lr FOREIGN KEY (sys_content_type_id) REFERENCES public.sys_content_type(id);


--
-- Name: ic_application fk_fv6e8wph6jtcs9g8ftq45rjky; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_reason_refusal
-- ALTER TABLE ONLY public.ic_application
--     ADD CONSTRAINT fk_fv6e8wph6jtcs9g8ftq45rjky FOREIGN KEY (reason_refusal_id) REFERENCES public.scp_dict_reason_refusal(id);


--
-- Name: corp_tech_application fk_fwk8df9vp75wd8c2pbg8ceshi; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_appl_type
-- ALTER TABLE ONLY public.corp_tech_application
--     ADD CONSTRAINT fk_fwk8df9vp75wd8c2pbg8ceshi FOREIGN KEY (scp_appl_type_id) REFERENCES public.scp_dict_appl_type(id);


--
-- Name: scp_dict_rsc_office fk_g310qo8yflrlrqededadu0d0f; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_dict_rsc_office
    ADD CONSTRAINT fk_g310qo8yflrlrqededadu0d0f FOREIGN KEY (rsc_office_id) REFERENCES public.offices_psb(id);


--
-- Name: scp_part_sec_expertise fk_g3rlwbhm1ohi0nox3jh6rarw2; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: sys_user
-- ALTER TABLE ONLY public.scp_part_sec_expertise
--     ADD CONSTRAINT fk_g3rlwbhm1ohi0nox3jh6rarw2 FOREIGN KEY (ses_resp_user_id) REFERENCES public.sys_user(id);


--
-- Name: dict_product fk_g5ayndhu3qj0wbhm78vqj97x7; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: amount_tender_loan
-- ALTER TABLE ONLY public.dict_product
--     ADD CONSTRAINT fk_g5ayndhu3qj0wbhm78vqj97x7 FOREIGN KEY (amount_tender_loan_id) REFERENCES public.amount_tender_loan(id);


--
-- Name: credit_contract fk_g8fth86t8l9w9peq11tetx751; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_ckp_risk_zone
-- ALTER TABLE ONLY public.credit_contract
--     ADD CONSTRAINT fk_g8fth86t8l9w9peq11tetx751 FOREIGN KEY (tech_selected_rz_id) REFERENCES public.dict_ckp_risk_zone(id);


--
-- Name: afhd_ac_trans_link fk_g9ejft5h3qq7owsd6v003930h; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: tbs_items
-- ALTER TABLE ONLY public.afhd_ac_trans_link
--     ADD CONSTRAINT fk_g9ejft5h3qq7owsd6v003930h FOREIGN KEY (tbs_item_id) REFERENCES public.tbs_items(id);


--
-- Name: corp_tech_application fk_g9id8k17fjr91db05yowdfwqd; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.corp_tech_application
    ADD CONSTRAINT fk_g9id8k17fjr91db05yowdfwqd FOREIGN KEY (interm_file_storage) REFERENCES public.fs_file(id);


--
-- Name: mler_application fk_gco3ljl89si7oeeh8qe6lb1yl; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.mler_application
    ADD CONSTRAINT fk_gco3ljl89si7oeeh8qe6lb1yl FOREIGN KEY (scp_tech_ctredit) REFERENCES public.scp_dict_tech_ctredit(id);


--
-- Name: scp_amd_product fk_gd5fd9tp8x5vvrj4m35cocnuk; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_amd_product
    ADD CONSTRAINT fk_gd5fd9tp8x5vvrj4m35cocnuk FOREIGN KEY (loan_type_afhd_id) REFERENCES public.type_loan(id);


--
-- Name: scp_amd_product fk_gi4jml5g0tngrqjh48txtem0c; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_amd_product
    ADD CONSTRAINT fk_gi4jml5g0tngrqjh48txtem0c FOREIGN KEY (amd_prod_link_id) REFERENCES public.scp_amd_product(id);


--
-- Name: scp_decision_quest fk_gp3gui8kkan8n76uenirb4pvs; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_decision_quest
    ADD CONSTRAINT fk_gp3gui8kkan8n76uenirb4pvs FOREIGN KEY (sys_file_id) REFERENCES public.fs_file(id);


--
-- Name: scp_application fk_gu9fbfw9sxvvld7b27gt88nk1; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: currency
-- ALTER TABLE ONLY public.scp_application
--     ADD CONSTRAINT fk_gu9fbfw9sxvvld7b27gt88nk1 FOREIGN KEY (lim_currency_id) REFERENCES public.currency(id);


--
-- Name: ic_application fk_h0d1ai3977f4fb07gwfqfaw60; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ic_application
    ADD CONSTRAINT fk_h0d1ai3977f4fb07gwfqfaw60 FOREIGN KEY (resp_cond_coord) REFERENCES public.sys_employee(id);


--
-- Name: ic_application fk_h46kue7rhfa5xxrhckmnqcvfs; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: afhd_gsl_calc_cont
-- ALTER TABLE ONLY public.ic_application
--     ADD CONSTRAINT fk_h46kue7rhfa5xxrhckmnqcvfs FOREIGN KEY (prelim_gsl_calc_id) REFERENCES public.afhd_gsl_calc_cont(id);


--
-- Name: scp_application fk_ha5adry6chmhjdmu3hb5b9l5l; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_type_req
-- ALTER TABLE ONLY public.scp_application
--     ADD CONSTRAINT fk_ha5adry6chmhjdmu3hb5b9l5l FOREIGN KEY (req_type_id) REFERENCES public.scp_dict_type_req(id);


--
-- Name: scp_decision_quest fk_hcwq26jaarimfxlke60vb8g1o; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: afhd_credit_report_clas
-- ALTER TABLE ONLY public.scp_decision_quest
--     ADD CONSTRAINT fk_hcwq26jaarimfxlke60vb8g1o FOREIGN KEY (credit_report_class) REFERENCES public.afhd_credit_report_clas(id);


--
-- Name: dict_product fk_he7odvtynm6sy9g2ggx31u0b6; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: spr_dyn_type
-- ALTER TABLE ONLY public.dict_product
--     ADD CONSTRAINT fk_he7odvtynm6sy9g2ggx31u0b6 FOREIGN KEY (dynam_type_id) REFERENCES public.spr_dyn_type(id);


--
-- Name: scp_application fk_hf21mc9ndglvpklf0lu142870; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_client_type
-- ALTER TABLE ONLY public.scp_application
--     ADD CONSTRAINT fk_hf21mc9ndglvpklf0lu142870 FOREIGN KEY (client_type_id) REFERENCES public.scp_dict_client_type(id);


--
-- Name: scp_project_ans fk_hft9sdippo4869dnlhkyr5ssq; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_change_init
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_hft9sdippo4869dnlhkyr5ssq FOREIGN KEY (change_initiator_id) REFERENCES public.scp_dict_change_init(id);


--
-- Name: scp_project_ans fk_hk5hy0r5l1kij9nsvta664n9n; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_amd_monit_regul
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_hk5hy0r5l1kij9nsvta664n9n FOREIGN KEY (collateral_monit) REFERENCES public.scp_amd_monit_regul(id);


--
-- Name: prod_guarantees fk_hlhlc7i9v1974g53b7qcppqug; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: guarantee_type_dict
-- ALTER TABLE ONLY public.prod_guarantees
--     ADD CONSTRAINT fk_hlhlc7i9v1974g53b7qcppqug FOREIGN KEY (guarantee_type_id) REFERENCES public.guarantee_type_dict(id);


--
-- Name: sys_company fk_hnu0tdonai8v0kqw5tk2566fe; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: afina_segment_dict
-- ALTER TABLE ONLY public.sys_company
--     ADD CONSTRAINT fk_hnu0tdonai8v0kqw5tk2566fe FOREIGN KEY (afina_segment_id) REFERENCES public.afina_segment_dict(id);


--
-- Name: yaig_client_gen_agr fk_hpxd8j5o0s2dyyc3as6yc5efi; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: yaig_gen_agr_type_dict
-- ALTER TABLE ONLY public.yaig_client_gen_agr
--     ADD CONSTRAINT fk_hpxd8j5o0s2dyyc3as6yc5efi FOREIGN KEY (yaig_gen_agr_type_id) REFERENCES public.yaig_gen_agr_type_dict(id);


--
-- Name: scp_amd_product fk_hrjd95kvk98wc20oc1wgpifhf; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: afhd_prov_part_product
-- ALTER TABLE ONLY public.scp_amd_product
--     ADD CONSTRAINT fk_hrjd95kvk98wc20oc1wgpifhf FOREIGN KEY (security_part_id) REFERENCES public.afhd_prov_part_product(id);


--
-- Name: corp_tech_application fk_hs6lhn3a0morombt5fkptxp0t; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_reason_refusal
-- ALTER TABLE ONLY public.corp_tech_application
--     ADD CONSTRAINT fk_hs6lhn3a0morombt5fkptxp0t FOREIGN KEY (reason_refusal_id) REFERENCES public.scp_dict_reason_refusal(id);


--
-- Name: sys_obj_type fk_hsmt0fjs6ao2qt537ch443sl6; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: display_obj_inst
-- ALTER TABLE ONLY public.sys_obj_type
--     ADD CONSTRAINT fk_hsmt0fjs6ao2qt537ch443sl6 FOREIGN KEY (display_obj_inst) REFERENCES public.display_obj_inst(id);


--
-- Name: mler_application fk_ht9nx3vfrw57dsxr9hs9ot085; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: credit_report
-- ALTER TABLE ONLY public.mler_application
--     ADD CONSTRAINT fk_ht9nx3vfrw57dsxr9hs9ot085 FOREIGN KEY (cr_id) REFERENCES public.credit_report(id);


--
-- Name: scp_collateral_app fk_i0t8sidm6656rhgjhiu3y512o; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_liquidity_level
-- ALTER TABLE ONLY public.scp_collateral_app
--     ADD CONSTRAINT fk_i0t8sidm6656rhgjhiu3y512o FOREIGN KEY (liquidity_level_id) REFERENCES public.dict_liquidity_level(id);


--
-- Name: product_pricing fk_i23ux3dfcv9i2xa35lc9q82xy; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.product_pricing
    ADD CONSTRAINT fk_i23ux3dfcv9i2xa35lc9q82xy FOREIGN KEY (owner_object_id) REFERENCES public.sys_object(id);


--
-- Name: sys_employee fk_idh1pl8jubgcpgb2y75lft8g5; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: sys_org_str
-- ALTER TABLE ONLY public.sys_employee
--     ADD CONSTRAINT fk_idh1pl8jubgcpgb2y75lft8g5 FOREIGN KEY (emp_org_id) REFERENCES public.sys_org_str(id);


--
-- Name: mler_application fk_idhr63vbk4nbay2r3e9itqan4; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.mler_application
    ADD CONSTRAINT fk_idhr63vbk4nbay2r3e9itqan4 FOREIGN KEY (emp_id) REFERENCES public.sys_employee(id);


--
-- Name: afhd_ac_trans_link fk_idr1kxgk6ahwqx4cv90phcbsb; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.afhd_ac_trans_link
    ADD CONSTRAINT fk_idr1kxgk6ahwqx4cv90phcbsb FOREIGN KEY (consolidation_obj_id) REFERENCES public.sys_object(id);


--
-- Name: corp_tech_application fk_if4bkoxqcexhx722bkfr14mw4; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.corp_tech_application
    ADD CONSTRAINT fk_if4bkoxqcexhx722bkfr14mw4 FOREIGN KEY (scp_arm_manager_id) REFERENCES public.sys_employee(id);


--
-- Name: dict_product fk_ifq7hf24jhk20ca3u48o2553e; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: type_of_guarantee
-- ALTER TABLE ONLY public.dict_product
--     ADD CONSTRAINT fk_ifq7hf24jhk20ca3u48o2553e FOREIGN KEY (type_of_guarantee_id) REFERENCES public.type_of_guarantee(id);


--
-- Name: corp_tech_application fk_ii572mys8l4jddpsc357ettxt; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.corp_tech_application
    ADD CONSTRAINT fk_ii572mys8l4jddpsc357ettxt FOREIGN KEY (initiator_id) REFERENCES public.sys_company(id);


--
-- Name: scp_application fk_iitjxcmdh29o0ms3ja8ivp20t; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_scp_risk_zone
-- ALTER TABLE ONLY public.scp_application
--     ADD CONSTRAINT fk_iitjxcmdh29o0ms3ja8ivp20t FOREIGN KEY (risk_zone_id) REFERENCES public.dict_scp_risk_zone(id);


--
-- Name: mler_application fk_ipy8cy8lpnx8l8t24yi4tpu4r; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: mler_decision_quest
-- ALTER TABLE ONLY public.mler_application
--     ADD CONSTRAINT fk_ipy8cy8lpnx8l8t24yi4tpu4r FOREIGN KEY (mler_decis_id) REFERENCES public.mler_decision_quest(id);


--
-- Name: ms_965j58mgwkpomnuooc29dlq9f fk_iqg8q8yl19ifx34x28y6cdf3w; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_965j58mgwkpomnuooc29dlq9f
    ADD CONSTRAINT fk_iqg8q8yl19ifx34x28y6cdf3w FOREIGN KEY (id) REFERENCES public.scp_gov_program_dict(id);


--
-- Name: dict_product fk_irr5gmnyosoms2o5rhdtsb89e; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: number_transactions
-- ALTER TABLE ONLY public.dict_product
--     ADD CONSTRAINT fk_irr5gmnyosoms2o5rhdtsb89e FOREIGN KEY (number_transactions_id) REFERENCES public.number_transactions(id);


--
-- Name: scp_application fk_it3tx4claga1dptdruwlskdv9; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: collateral_cont
-- ALTER TABLE ONLY public.scp_application
--     ADD CONSTRAINT fk_it3tx4claga1dptdruwlskdv9 FOREIGN KEY (collateral_cont_id) REFERENCES public.collateral_cont(id);


--
-- Name: product_pricing fk_iu6x6kep7kiwi938orjljwi5y; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: product_compound_dict
-- ALTER TABLE ONLY public.product_pricing
--     ADD CONSTRAINT fk_iu6x6kep7kiwi938orjljwi5y FOREIGN KEY (product_compound_id) REFERENCES public.product_compound_dict(id);


--
-- Name: scp_project_ans fk_iw6m1rm9fpfn7t37pmuh9c7oq; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_allowed_notallowed
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_iw6m1rm9fpfn7t37pmuh9c7oq FOREIGN KEY (blanc_deal_asmt_result) REFERENCES public.dict_allowed_notallowed(id);


--
-- Name: scp_part_sec_expertise fk_iyeakiq4yqeu45fockfbxvkfw; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_part_sec_expertise
    ADD CONSTRAINT fk_iyeakiq4yqeu45fockfbxvkfw FOREIGN KEY (sec_expertise_id) REFERENCES public.scp_sec_expertise(id);


--
-- Name: yaig_client_guarantee fk_j3h3gn3pn3jye951i4savoorb; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.yaig_client_guarantee
    ADD CONSTRAINT fk_j3h3gn3pn3jye951i4savoorb FOREIGN KEY (yaig_product_id) REFERENCES public.yaig_product_dict(id);


--
-- Name: scp_prod_guarant_dict fk_j4sj5qjn32ibv1uarav11oftb; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: guarantee_type_dict
-- ALTER TABLE ONLY public.scp_prod_guarant_dict
--     ADD CONSTRAINT fk_j4sj5qjn32ibv1uarav11oftb FOREIGN KEY (guarantee_type_id) REFERENCES public.guarantee_type_dict(id);


--
-- Name: ms_1fd5jp86pabxu9na4knwphvyr fk_j5bkevnwd9rduces4n7mph6tb; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_1fd5jp86pabxu9na4knwphvyr
    ADD CONSTRAINT fk_j5bkevnwd9rduces4n7mph6tb FOREIGN KEY (id) REFERENCES public.scp_gov_program_dict(id);


--
-- Name: scp_collateral_app fk_j5nqt9msp43dl24qg7fkejbjr; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_collateral_app
    ADD CONSTRAINT fk_j5nqt9msp43dl24qg7fkejbjr FOREIGN KEY (scp_info_type_prod_id) REFERENCES public.dict_product(id);


--
-- Name: scp_collateral_app fk_j6eye5y51qhmt6nb6qfdmn3jv; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: collateral_type_na
-- ALTER TABLE ONLY public.scp_collateral_app
--     ADD CONSTRAINT fk_j6eye5y51qhmt6nb6qfdmn3jv FOREIGN KEY (na_pledge_type_id) REFERENCES public.collateral_type_na(id);


--
-- Name: scp_application fk_j8wdcypkiiokx724u7sm99pq6; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: afhd_gsl_calc_cont
-- ALTER TABLE ONLY public.scp_application
--     ADD CONSTRAINT fk_j8wdcypkiiokx724u7sm99pq6 FOREIGN KEY (prelim_gsl_calc_id) REFERENCES public.afhd_gsl_calc_cont(id);


--
-- Name: ms_0oc5mpme8nklimjy77sai9gf1 fk_jcatpma5gf3sty766xlvnvhsa; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_0oc5mpme8nklimjy77sai9gf1
    ADD CONSTRAINT fk_jcatpma5gf3sty766xlvnvhsa FOREIGN KEY (id) REFERENCES public.scp_prod_comm_dict(id);


--
-- Name: scp_collateral_app fk_jcipp0k8qxpa7rbqy2d99iyk3; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_collateral_app
    ADD CONSTRAINT fk_jcipp0k8qxpa7rbqy2d99iyk3 FOREIGN KEY (cur_upd_appl_id) REFERENCES public.scp_collateral_app(id);


--
-- Name: prod_guarantees fk_jd99inlxv936whb39xk13mifj; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.prod_guarantees
    ADD CONSTRAINT fk_jd99inlxv936whb39xk13mifj FOREIGN KEY (prod_guarant_dict_id) REFERENCES public.scp_prod_guarant_dict(id);


--
-- Name: scp_application fk_jfnoei13eq3x8m2k4nstmt72l; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_head_cm_decision
-- ALTER TABLE ONLY public.scp_application
--     ADD CONSTRAINT fk_jfnoei13eq3x8m2k4nstmt72l FOREIGN KEY (scp_hcm_decision_id) REFERENCES public.scp_head_cm_decision(id);


--
-- Name: credit_contract fk_jg1he04oksu92xxfdoula0bts; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: prof_judjment_indiv
-- ALTER TABLE ONLY public.credit_contract
--     ADD CONSTRAINT fk_jg1he04oksu92xxfdoula0bts FOREIGN KEY (prof_judg_id) REFERENCES public.prof_judjment_indiv(id);


--
-- Name: scp_dict_product_na fk_jheki4qthk9t5u5t4pwa57hu7; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_contract_group
-- ALTER TABLE ONLY public.scp_dict_product_na
--     ADD CONSTRAINT fk_jheki4qthk9t5u5t4pwa57hu7 FOREIGN KEY (contr_group_id) REFERENCES public.dict_contract_group(id);


--
-- Name: corp_tech_application fk_jlk2ffhpx1bbi5jdqha6ngc42; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.corp_tech_application
    ADD CONSTRAINT fk_jlk2ffhpx1bbi5jdqha6ngc42 FOREIGN KEY (scp_tech_ctredit) REFERENCES public.scp_dict_tech_ctredit(id);


--
-- Name: scp_prod_comm_dict fk_joy8bbswvu83lp6lg5cojn6ui; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_change_comiss_dict
-- ALTER TABLE ONLY public.scp_prod_comm_dict
--     ADD CONSTRAINT fk_joy8bbswvu83lp6lg5cojn6ui FOREIGN KEY (change_comiss_dict_id) REFERENCES public.scp_change_comiss_dict(id);


--
-- Name: corp_tech_application fk_jpgdoo9i65rjx2h3pb6abq2p7; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.corp_tech_application
    ADD CONSTRAINT fk_jpgdoo9i65rjx2h3pb6abq2p7 FOREIGN KEY (emp_id) REFERENCES public.sys_employee(id);


--
-- Name: mler_application fk_jqgdyoufjkxblgjwqlttc2huw; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.mler_application
    ADD CONSTRAINT fk_jqgdyoufjkxblgjwqlttc2huw FOREIGN KEY (deleg_region_id) REFERENCES public.dict_div_presence(id);


--
-- Name: application_obj fk_jqwdvoi5wgl2fb213b5ynxl9e; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: temp_obj_load_turn
-- ALTER TABLE ONLY public.application_obj
--     ADD CONSTRAINT fk_jqwdvoi5wgl2fb213b5ynxl9e FOREIGN KEY (temp_cont_turn) REFERENCES public.temp_obj_load_turn(id);


--
-- Name: dict_product fk_jucy4o42txpqc4kdqm15ow9e7; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: tech_decision
-- ALTER TABLE ONLY public.dict_product
--     ADD CONSTRAINT fk_jucy4o42txpqc4kdqm15ow9e7 FOREIGN KEY (tech_decision_id) REFERENCES public.tech_decision(id);


--
-- Name: sys_company fk_jv584wpae6h939euhdkueclhp; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: general_activity_guide
-- ALTER TABLE ONLY public.sys_company
--     ADD CONSTRAINT fk_jv584wpae6h939euhdkueclhp FOREIGN KEY (main_okved) REFERENCES public.general_activity_guide(id);


--
-- Name: afhd_ac_trans_link fk_k0lr0pwdad6kvhrahymmy0u7x; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: risk_form_row_spr
-- ALTER TABLE ONLY public.afhd_ac_trans_link
--     ADD CONSTRAINT fk_k0lr0pwdad6kvhrahymmy0u7x FOREIGN KEY (dummy_row_id) REFERENCES public.risk_form_row_spr(id);


--
-- Name: ic_application fk_k2t7c10u3m4hmdoa3w38rn5bi; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ic_application
    ADD CONSTRAINT fk_k2t7c10u3m4hmdoa3w38rn5bi FOREIGN KEY (scp_business_segment) REFERENCES public.business_segment(id);


--
-- Name: afhd_ac_trans_link fk_k34kmy036o7j0iuyhrs8f2o0x; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_comp_sign
-- ALTER TABLE ONLY public.afhd_ac_trans_link
--     ADD CONSTRAINT fk_k34kmy036o7j0iuyhrs8f2o0x FOREIGN KEY (multiplicator_sign_id) REFERENCES public.dict_comp_sign(id);


--
-- Name: afhd_ac_trans_link fk_k4vkn5e9xj2fym84dk6u9jbm2; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_balance_type
-- ALTER TABLE ONLY public.afhd_ac_trans_link
--     ADD CONSTRAINT fk_k4vkn5e9xj2fym84dk6u9jbm2 FOREIGN KEY (balance_type_id) REFERENCES public.dict_balance_type(id);


--
-- Name: dict_product fk_k6872eagae89s0rkf06myit5x; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: volume_revenue
-- ALTER TABLE ONLY public.dict_product
--     ADD CONSTRAINT fk_k6872eagae89s0rkf06myit5x FOREIGN KEY (volume_revenue_id) REFERENCES public.volume_revenue(id);


--
-- Name: application_obj fk_k746dtstoakss6aca6pcis9i0; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: afhd_gsl_data_cont
-- ALTER TABLE ONLY public.application_obj
--     ADD CONSTRAINT fk_k746dtstoakss6aca6pcis9i0 FOREIGN KEY (gsl_data_cont_id) REFERENCES public.afhd_gsl_data_cont(id);


--
-- Name: scp_project_ans fk_k9owm3glcghs2q9n6rk13i9mp; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_restruct_initiator
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_k9owm3glcghs2q9n6rk13i9mp FOREIGN KEY (restruct_init_id) REFERENCES public.scp_restruct_initiator(id);


--
-- Name: application_obj fk_k9py588khw3hty9mmpjm15en0; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_industry_code
-- ALTER TABLE ONLY public.application_obj
--     ADD CONSTRAINT fk_k9py588khw3hty9mmpjm15en0 FOREIGN KEY (industry_code_id) REFERENCES public.scp_dict_industry_code(id);


--
-- Name: ms_e5lum3lbateqhx8wkgtstxdf9 fk_kcw6ildjg1rlqovhw4kbgjjw2; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_e5lum3lbateqhx8wkgtstxdf9
    ADD CONSTRAINT fk_kcw6ildjg1rlqovhw4kbgjjw2 FOREIGN KEY (obj_id) REFERENCES public.scp_dict_tech_ctredit(id);


--
-- Name: mler_application fk_kdwrc9y3v9mefudddg3u2m7ls; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.mler_application
    ADD CONSTRAINT fk_kdwrc9y3v9mefudddg3u2m7ls FOREIGN KEY (chief_initiator_id) REFERENCES public.sys_employee(id);


--
-- Name: corp_tech_application fk_klhye6xckndutnl6tmaemt5me; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_type_restruct
-- ALTER TABLE ONLY public.corp_tech_application
--     ADD CONSTRAINT fk_klhye6xckndutnl6tmaemt5me FOREIGN KEY (scp_type_restruct_id) REFERENCES public.scp_dict_type_restruct(id);


--
-- Name: scp_application fk_kophryn1k4fbtyd2yyo37blru; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_proc_steps_dict
-- ALTER TABLE ONLY public.scp_application
--     ADD CONSTRAINT fk_kophryn1k4fbtyd2yyo37blru FOREIGN KEY (scp_proc_steds_id) REFERENCES public.scp_proc_steps_dict(id);


--
-- Name: corp_tech_application fk_kpus64yu8b6latch4xwaop10l; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.corp_tech_application
    ADD CONSTRAINT fk_kpus64yu8b6latch4xwaop10l FOREIGN KEY (afp_state_id) REFERENCES public.sys_state(id);


--
-- Name: scp_decision_quest fk_kqbqk7gop54vgmyfmfouudwwe; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: rate_type_dict
-- ALTER TABLE ONLY public.scp_decision_quest
--     ADD CONSTRAINT fk_kqbqk7gop54vgmyfmfouudwwe FOREIGN KEY (rate_type_id) REFERENCES public.rate_type_dict(id);


--
-- Name: product_pricing fk_kraibsf8rswob5r9gvdn2cpok; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.product_pricing
    ADD CONSTRAINT fk_kraibsf8rswob5r9gvdn2cpok FOREIGN KEY (type_loan_id) REFERENCES public.type_loan(id);


--
-- Name: scp_project_ans fk_kt0hjqv1wb1mxokwh30q2gub7; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_matrix_type
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_kt0hjqv1wb1mxokwh30q2gub7 FOREIGN KEY (scp_matrix_type) REFERENCES public.scp_matrix_type(id);


--
-- Name: product_pricing fk_kthoeyy24k1n3ixir87p6jmsf; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: product_pricing_cast
-- ALTER TABLE ONLY public.product_pricing
--     ADD CONSTRAINT fk_kthoeyy24k1n3ixir87p6jmsf FOREIGN KEY (product_pricing_cast_id) REFERENCES public.product_pricing_cast(id);


--
-- Name: count_turnover fk_kuleme3kfhfl0p966rxotcb6m; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.count_turnover
    ADD CONSTRAINT fk_kuleme3kfhfl0p966rxotcb6m FOREIGN KEY (link_load_val_id) REFERENCES public.sys_object(id);


--
-- Name: sys_algorithm fk_kuvi3qi1838n8yueiv5k91a3u; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.sys_algorithm
    ADD CONSTRAINT fk_kuvi3qi1838n8yueiv5k91a3u FOREIGN KEY (amy_base_type_id) REFERENCES public.sys_obj_type(id);


--
-- Name: product_pricing fk_kvts4fhwqcv46ve0k1ikqdms9; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: pay_reward_cond_dict
-- ALTER TABLE ONLY public.product_pricing
--     ADD CONSTRAINT fk_kvts4fhwqcv46ve0k1ikqdms9 FOREIGN KEY (pay_reward_cond_id) REFERENCES public.pay_reward_cond_dict(id);


--
-- Name: sys_obj_type fk_kxkj11io7hswo6sfujcc6v6k3; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: sys_alg_card
-- ALTER TABLE ONLY public.sys_obj_type
--     ADD CONSTRAINT fk_kxkj11io7hswo6sfujcc6v6k3 FOREIGN KEY (alg_saved_id) REFERENCES public.sys_alg_card(id);


--
-- Name: offices_psb fk_kyx8ju19g3dkq23wl0r4da83l; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.offices_psb
    ADD CONSTRAINT fk_kyx8ju19g3dkq23wl0r4da83l FOREIGN KEY (org_company) REFERENCES public.sys_company(id);


--
-- Name: scp_project_ans fk_l49in49pp1x9y14yoar8empx8; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_industry_code
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_l49in49pp1x9y14yoar8empx8 FOREIGN KEY (industry_code_id) REFERENCES public.scp_dict_industry_code(id);


--
-- Name: scp_application fk_lj3fnkajeht4b5ialvsxljwnm; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_application
    ADD CONSTRAINT fk_lj3fnkajeht4b5ialvsxljwnm FOREIGN KEY (scp_bg_owner_lidm) REFERENCES public.sys_employee(id);


--
-- Name: ic_application fk_ls2rc6uer4cpb07iwrfa62h6t; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ic_application
    ADD CONSTRAINT fk_ls2rc6uer4cpb07iwrfa62h6t FOREIGN KEY (scp_tech_ctredit) REFERENCES public.scp_dict_tech_ctredit(id);


--
-- Name: mler_application fk_ltrd1rvvs9h8ucygb6xt1b798; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.mler_application
    ADD CONSTRAINT fk_ltrd1rvvs9h8ucygb6xt1b798 FOREIGN KEY (execut_admin_id) REFERENCES public.sys_employee(id);


--
-- Name: scp_collateral_app fk_lw4rpiy4n383fnif0oq62aepp; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: collateral_type_na
-- ALTER TABLE ONLY public.scp_collateral_app
--     ADD CONSTRAINT fk_lw4rpiy4n383fnif0oq62aepp FOREIGN KEY (scp_info_type_na_id) REFERENCES public.collateral_type_na(id);


--
-- Name: fs_file fk_lwqxay9xmvkr6b47lkx88vqrk; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: fs_file_type
-- ALTER TABLE ONLY public.fs_file
--     ADD CONSTRAINT fk_lwqxay9xmvkr6b47lkx88vqrk FOREIGN KEY (ff_type_id) REFERENCES public.fs_file_type(id);


--
-- Name: corp_tech_application fk_lxrsedrlk7fb2cqjcpj86rcge; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_reason_client
-- ALTER TABLE ONLY public.corp_tech_application
--     ADD CONSTRAINT fk_lxrsedrlk7fb2cqjcpj86rcge FOREIGN KEY (scp_rejection_client_id) REFERENCES public.scp_dict_reason_client(id);


--
-- Name: scp_decision_quest fk_lyonkl960e5u64elhhb96weux; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_yes_no
-- ALTER TABLE ONLY public.scp_decision_quest
--     ADD CONSTRAINT fk_lyonkl960e5u64elhhb96weux FOREIGN KEY (part_excl_ship_debitor) REFERENCES public.dict_yes_no(id);


--
-- Name: scp_project_ans fk_lyra9mahfagu1amvbna7apqwv; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_project_ans
    ADD CONSTRAINT fk_lyra9mahfagu1amvbna7apqwv FOREIGN KEY (scp_state_id) REFERENCES public.sys_state(id);


--
-- Name: scp_collateral_app fk_m427twrx5pdcwjo9s5bv9v3aw; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_collateral_app
    ADD CONSTRAINT fk_m427twrx5pdcwjo9s5bv9v3aw FOREIGN KEY (app_obj_id) REFERENCES public.application_obj(id);


--
-- Name: scp_part_sec_expertise fk_m4ra9j7fc5ts7338aphaniwpm; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: registration_app
-- ALTER TABLE ONLY public.scp_part_sec_expertise
--     ADD CONSTRAINT fk_m4ra9j7fc5ts7338aphaniwpm FOREIGN KEY (csd_expertise_obj_id) REFERENCES public.registration_app(id);


--
-- Name: scp_sec_expertise fk_m755aaj2i9surb8ngwsdikqqu; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_sec_expertise
    ADD CONSTRAINT fk_m755aaj2i9surb8ngwsdikqqu FOREIGN KEY (reg_resp_emp) REFERENCES public.sys_employee(id);


--
-- Name: participant_app fk_m9wmylycrgylvqan1yorakacg; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_gsl_participants
-- ALTER TABLE ONLY public.participant_app
--     ADD CONSTRAINT fk_m9wmylycrgylvqan1yorakacg FOREIGN KEY (scp_link_particip_id) REFERENCES public.scp_gsl_participants(id);


--
-- Name: afhd_ac_trans_link fk_mbb5vcfbo3pkun9avh0wv9jui; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.afhd_ac_trans_link
    ADD CONSTRAINT fk_mbb5vcfbo3pkun9avh0wv9jui FOREIGN KEY (cnt_turnover_id) REFERENCES public.count_turnover(id);


--
-- Name: scp_project_ans fk_mbmcenhvyowfvfnd22cdmvrlc; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_project_ans
    ADD CONSTRAINT fk_mbmcenhvyowfvfnd22cdmvrlc FOREIGN KEY (loan_type_id) REFERENCES public.type_loan(id);


--
-- Name: ms_dlggiqkhqj46rhq1lrgryim7c fk_md19td1hdaoy8uod0jklr8vfx; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_dlggiqkhqj46rhq1lrgryim7c
    ADD CONSTRAINT fk_md19td1hdaoy8uod0jklr8vfx FOREIGN KEY (obj_id) REFERENCES public.scp_techcred(id);


--
-- Name: application_obj fk_mix4tqw7afuj1bh2f332k2lxi; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: credit_report
-- ALTER TABLE ONLY public.application_obj
--     ADD CONSTRAINT fk_mix4tqw7afuj1bh2f332k2lxi FOREIGN KEY (cr_id) REFERENCES public.credit_report(id);


--
-- Name: scp_collateral_app fk_mktvk5dyymnubgs054v1uqdjp; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_collateral_app
    ADD CONSTRAINT fk_mktvk5dyymnubgs054v1uqdjp FOREIGN KEY (scp_info_pledger_id) REFERENCES public.sys_company(id);


--
-- Name: scp_collateral_app fk_mnddua3e99pen3qhigr7hvgek; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_collateral_app
    ADD CONSTRAINT fk_mnddua3e99pen3qhigr7hvgek FOREIGN KEY (emp_id) REFERENCES public.sys_employee(id);


--
-- Name: scp_collateral_app fk_mnlymw2sm84mmlex8oi6wyup6; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_collateral_app
    ADD CONSTRAINT fk_mnlymw2sm84mmlex8oi6wyup6 FOREIGN KEY (scp_quest_dec_id) REFERENCES public.scp_decision_quest(id);


--
-- Name: ic_application fk_mpeuhv7s0248percwyfdrch2f; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ic_application
    ADD CONSTRAINT fk_mpeuhv7s0248percwyfdrch2f FOREIGN KEY (emp_id) REFERENCES public.sys_employee(id);


--
-- Name: scp_application fk_mqpsv868tlr00vat4ypwrbunw; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_application
    ADD CONSTRAINT fk_mqpsv868tlr00vat4ypwrbunw FOREIGN KEY (deleg_region_id) REFERENCES public.dict_div_presence(id);


--
-- Name: ms_39qrctc1n8efr9axiukjssgzl fk_mvg288gv2kyqul4xywy2q6vkn; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_39qrctc1n8efr9axiukjssgzl
    ADD CONSTRAINT fk_mvg288gv2kyqul4xywy2q6vkn FOREIGN KEY (obj_id) REFERENCES public.type_loan(id);


--
-- Name: afhd_ac_trans_link fk_mx6ghwtnkrb0d1veo4d7yjfrd; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: risk_form_row_spr
-- ALTER TABLE ONLY public.afhd_ac_trans_link
--     ADD CONSTRAINT fk_mx6ghwtnkrb0d1veo4d7yjfrd FOREIGN KEY (source_row_id) REFERENCES public.risk_form_row_spr(id);


--
-- Name: scp_collateral_app fk_myo2sg10yukci29ojyb5p08sf; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_vnd
-- ALTER TABLE ONLY public.scp_collateral_app
--     ADD CONSTRAINT fk_myo2sg10yukci29ojyb5p08sf FOREIGN KEY (scp_info_vnd_id) REFERENCES public.scp_dict_vnd(id);


--
-- Name: scp_project_ans fk_n04a2knq6mcg5dq2j4xp9llwr; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_type_req
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_n04a2knq6mcg5dq2j4xp9llwr FOREIGN KEY (req_type_id) REFERENCES public.scp_dict_type_req(id);


--
-- Name: application_obj fk_n1gnkor6efqvr8g0cjh45h9gj; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.application_obj
    ADD CONSTRAINT fk_n1gnkor6efqvr8g0cjh45h9gj FOREIGN KEY (scp_business_segment) REFERENCES public.business_segment(id);


--
-- Name: ms_333s6j5jn97srp008gyi3zueo fk_n2pf7h0i21ybys5a4nh5x8kp3; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_333s6j5jn97srp008gyi3zueo
    ADD CONSTRAINT fk_n2pf7h0i21ybys5a4nh5x8kp3 FOREIGN KEY (obj_id) REFERENCES public.sys_state(id);


--
-- Name: scp_amd_product fk_n3cr8uh4mthwjqx6jbfl5jts2; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_amd_product
    ADD CONSTRAINT fk_n3cr8uh4mthwjqx6jbfl5jts2 FOREIGN KEY (amdp_parent_product_id) REFERENCES public.scp_amd_product(id);


--
-- Name: prod_change_params fk_n5wl4o49tcvxinri8gstf64ju; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: prod_change_param_dict
-- ALTER TABLE ONLY public.prod_change_params
--     ADD CONSTRAINT fk_n5wl4o49tcvxinri8gstf64ju FOREIGN KEY (change_param_dict_id) REFERENCES public.prod_change_param_dict(id);


--
-- Name: mler_application fk_n6l0pkfo65scpbb9sychy17a6; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_proc_steps_dict
-- ALTER TABLE ONLY public.mler_application
--     ADD CONSTRAINT fk_n6l0pkfo65scpbb9sychy17a6 FOREIGN KEY (scp_proc_steds_id) REFERENCES public.scp_proc_steps_dict(id);


--
-- Name: scp_project_ans fk_n73uwqur9r044p5jdh9jedrwh; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_contract_code
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_n73uwqur9r044p5jdh9jedrwh FOREIGN KEY (loan_sign_st_ot_id) REFERENCES public.scp_contract_code(id);


--
-- Name: corp_tech_application fk_n7o536bfwemy0d1ggrh6rj2o3; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: afhd_gsl_calc_cont
-- ALTER TABLE ONLY public.corp_tech_application
--     ADD CONSTRAINT fk_n7o536bfwemy0d1ggrh6rj2o3 FOREIGN KEY (prelim_gsl_calc_id) REFERENCES public.afhd_gsl_calc_cont(id);


--
-- Name: product_pricing fk_n7we3seefl9os5fr6o2g4k2w4; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: clc_zones
-- ALTER TABLE ONLY public.product_pricing
--     ADD CONSTRAINT fk_n7we3seefl9os5fr6o2g4k2w4 FOREIGN KEY (clc_zone_id) REFERENCES public.clc_zones(id);


--
-- Name: scp_application fk_n9e6r3jhywjchpq7qd9wrhmix; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_application
    ADD CONSTRAINT fk_n9e6r3jhywjchpq7qd9wrhmix FOREIGN KEY (initiator_id) REFERENCES public.sys_company(id);


--
-- Name: fs_file fk_nb8aelif4ljlm75w81dvmyknw; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: fs_file_kind
-- ALTER TABLE ONLY public.fs_file
--     ADD CONSTRAINT fk_nb8aelif4ljlm75w81dvmyknw FOREIGN KEY (ff_kind_id) REFERENCES public.fs_file_kind(id);


--
-- Name: participant_app fk_nbquwcg7ulqf5cp1o1j2ggoh9; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.participant_app
    ADD CONSTRAINT fk_nbquwcg7ulqf5cp1o1j2ggoh9 FOREIGN KEY (particip_sec_id) REFERENCES public.scp_part_sec_expertise(id);


--
-- Name: scp_application fk_ncfa6npf90lgklm8rffigi5or; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_type_restruct
-- ALTER TABLE ONLY public.scp_application
--     ADD CONSTRAINT fk_ncfa6npf90lgklm8rffigi5or FOREIGN KEY (scp_type_restruct_id) REFERENCES public.scp_dict_type_restruct(id);


--
-- Name: application_obj fk_nd7qmf7s9ri5kybaksndyxnnj; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.application_obj
    ADD CONSTRAINT fk_nd7qmf7s9ri5kybaksndyxnnj FOREIGN KEY (initiator_id) REFERENCES public.sys_object(id);


--
-- Name: count_turnover fk_ndno3qv9kol1u9a6cjdwua69d; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: risk_form_row_spr
-- ALTER TABLE ONLY public.count_turnover
--     ADD CONSTRAINT fk_ndno3qv9kol1u9a6cjdwua69d FOREIGN KEY (bb_debet_id) REFERENCES public.risk_form_row_spr(id);


--
-- Name: scp_decision_quest fk_nflyqxjifhsk48tpfdf1olyyt; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_decision_quest
    ADD CONSTRAINT fk_nflyqxjifhsk48tpfdf1olyyt FOREIGN KEY (amdp_parent_product_id) REFERENCES public.scp_amd_product(id);


--
-- Name: corp_tech_application fk_ng8ibowbpbt0os1ia7kw5l4hh; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.corp_tech_application
    ADD CONSTRAINT fk_ng8ibowbpbt0os1ia7kw5l4hh FOREIGN KEY (resp_cond_coord) REFERENCES public.sys_employee(id);


--
-- Name: sys_obj_type fk_nggjhqqpapi3kqkd8vjkcm1ro; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: sys_type_attr
-- ALTER TABLE ONLY public.sys_obj_type
--     ADD CONSTRAINT fk_nggjhqqpapi3kqkd8vjkcm1ro FOREIGN KEY (link_access_attr_id) REFERENCES public.sys_type_attr(id);


--
-- Name: credit_contract fk_ngj7h9o2w4wq7s8mi1ixrt6xt; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: supplemental_aggreement
-- ALTER TABLE ONLY public.credit_contract
--     ADD CONSTRAINT fk_ngj7h9o2w4wq7s8mi1ixrt6xt FOREIGN KEY (supplement_tech) REFERENCES public.supplemental_aggreement(id);


--
-- Name: prod_commissions fk_nh408a6590v6tswsohplrgk32; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.prod_commissions
    ADD CONSTRAINT fk_nh408a6590v6tswsohplrgk32 FOREIGN KEY (prod_comm_dict_id) REFERENCES public.scp_prod_comm_dict(id);


--
-- Name: scp_prod_guar_dict fk_ni3b0wyhr05i12hla4ffkj2ou; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: gov_prog_value_dict
-- ALTER TABLE ONLY public.scp_prod_guar_dict
--     ADD CONSTRAINT fk_ni3b0wyhr05i12hla4ffkj2ou FOREIGN KEY (gov_prog_value) REFERENCES public.gov_prog_value_dict(id);


--
-- Name: afhd_ac_trans_link fk_nkopps0ati93fhsptyoiawtpp; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.afhd_ac_trans_link
    ADD CONSTRAINT fk_nkopps0ati93fhsptyoiawtpp FOREIGN KEY (copy_source_ac_tr_l_id) REFERENCES public.afhd_ac_trans_link(id);


--
-- Name: application_obj fk_nkw12c4dmo15nwbfkmmgmvhs9; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_client_type
-- ALTER TABLE ONLY public.application_obj
--     ADD CONSTRAINT fk_nkw12c4dmo15nwbfkmmgmvhs9 FOREIGN KEY (client_type_id) REFERENCES public.scp_dict_client_type(id);


--
-- Name: prod_change_params fk_nl884e7406kuxvbfcn2asd26t; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: comm_date_pay_dict
-- ALTER TABLE ONLY public.prod_change_params
--     ADD CONSTRAINT fk_nl884e7406kuxvbfcn2asd26t FOREIGN KEY (comm_date_pay_id) REFERENCES public.comm_date_pay_dict(id);


--
-- Name: scp_application fk_nm7lvw1a2l6ig52li098v14cf; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_application
    ADD CONSTRAINT fk_nm7lvw1a2l6ig52li098v14cf FOREIGN KEY (curator_head_id) REFERENCES public.sys_employee(id);


--
-- Name: scp_project_ans fk_nmbhyanuy0h3npt1248ifd5mp; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_yes_no_notneeded
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_nmbhyanuy0h3npt1248ifd5mp FOREIGN KEY (susp_cond_prev_id) REFERENCES public.dict_yes_no_notneeded(id);


--
-- Name: offices_psb fk_nsadoxc52gru9tk0sw7fga1rc; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: psb_dep_org
-- ALTER TABLE ONLY public.offices_psb
--     ADD CONSTRAINT fk_nsadoxc52gru9tk0sw7fga1rc FOREIGN KEY (psb_dep_org) REFERENCES public.psb_dep_org(id);


--
-- Name: scp_project_ans fk_nwl8rh66c1t6u9jjqtnw9p7as; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: draft_decision
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_nwl8rh66c1t6u9jjqtnw9p7as FOREIGN KEY (draft_decision_id) REFERENCES public.draft_decision(id);


--
-- Name: scp_project_ans fk_nwmwlj0drnujl7d9n2ioye613; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: underwr_dec_status_dict
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_nwmwlj0drnujl7d9n2ioye613 FOREIGN KEY (urm_undwrt_decision_id) REFERENCES public.underwr_dec_status_dict(id);


--
-- Name: fs_file fk_nx0ai6iuseikead4aowe0uts9; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.fs_file
    ADD CONSTRAINT fk_nx0ai6iuseikead4aowe0uts9 FOREIGN KEY (ff_parent_object) REFERENCES public.sys_object(id);


--
-- Name: credit_contract fk_o0ls3qq78am56xa206spf5fqu; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: cr_status
-- ALTER TABLE ONLY public.credit_contract
--     ADD CONSTRAINT fk_o0ls3qq78am56xa206spf5fqu FOREIGN KEY (cr_status_id) REFERENCES public.cr_status(id);


--
-- Name: sys_employee fk_o1rsh9qww8h4woix9lid1gx41; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dmm_personal_options
-- ALTER TABLE ONLY public.sys_employee
--     ADD CONSTRAINT fk_o1rsh9qww8h4woix9lid1gx41 FOREIGN KEY (pers_opt_dmm_link) REFERENCES public.dmm_personal_options(id);


--
-- Name: scp_project_ans fk_o7bxethxfyd4vh8uyyl77h2b6; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: undwrt_decis_level_dict
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_o7bxethxfyd4vh8uyyl77h2b6 FOREIGN KEY (min_decis_level_id) REFERENCES public.undwrt_decis_level_dict(id);


--
-- Name: count_turnover fk_o8e1wl1mtkfyvlibq5t732b1x; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.count_turnover
    ADD CONSTRAINT fk_o8e1wl1mtkfyvlibq5t732b1x FOREIGN KEY (parent_link_count) REFERENCES public.count_turnover(id);


--
-- Name: ms_333s6j5jn97srp008gyi3zueo fk_ob4ivqcjg4ns5x0402ivtd7pe; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_333s6j5jn97srp008gyi3zueo
    ADD CONSTRAINT fk_ob4ivqcjg4ns5x0402ivtd7pe FOREIGN KEY (id) REFERENCES public.mler_application(id);


--
-- Name: credit_contract fk_oe7tmxx94jkrcgnop01hp5rnb; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.credit_contract
    ADD CONSTRAINT fk_oe7tmxx94jkrcgnop01hp5rnb FOREIGN KEY (sys_employee_id) REFERENCES public.sys_employee(id);


--
-- Name: ms_0n8ohjyx7oszo6a47ca9g0s6f fk_of32tgpl85rr0csff2h2u7xkc; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_0n8ohjyx7oszo6a47ca9g0s6f
    ADD CONSTRAINT fk_of32tgpl85rr0csff2h2u7xkc FOREIGN KEY (id) REFERENCES public.corp_tech_application(id) ON DELETE CASCADE;


--
-- Name: scp_collateral_app fk_of88kuj6h7pp5n6pvj0y7lv3v; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: directory_collat_object
-- ALTER TABLE ONLY public.scp_collateral_app
--     ADD CONSTRAINT fk_of88kuj6h7pp5n6pvj0y7lv3v FOREIGN KEY (pledge_subject_id) REFERENCES public.directory_collat_object(id);


--
-- Name: offices_psb fk_ofrhr4rs9ddn0bvd5p01kb03f; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: sys_org_str
-- ALTER TABLE ONLY public.offices_psb
--     ADD CONSTRAINT fk_ofrhr4rs9ddn0bvd5p01kb03f FOREIGN KEY (main_org) REFERENCES public.sys_org_str(id);


--
-- Name: scp_application fk_oge3jrs85k3wof3jr8092i3p3; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_application
    ADD CONSTRAINT fk_oge3jrs85k3wof3jr8092i3p3 FOREIGN KEY (interm_file_storage) REFERENCES public.fs_file(id);


--
-- Name: ic_application fk_oggk5oof74w6kde2spetl8n7x; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_client_type
-- ALTER TABLE ONLY public.ic_application
--     ADD CONSTRAINT fk_oggk5oof74w6kde2spetl8n7x FOREIGN KEY (client_type_id) REFERENCES public.scp_dict_client_type(id);


--
-- Name: scp_collateral_app fk_oh0b0b0o27c8mepvlbhrkqcp0; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: spr_yes_no
-- ALTER TABLE ONLY public.scp_collateral_app
--     ADD CONSTRAINT fk_oh0b0b0o27c8mepvlbhrkqcp0 FOREIGN KEY (scp_project_fin_id) REFERENCES public.spr_yes_no(id);


--
-- Name: scp_decision_quest fk_ohm9opaarqfyqqv1rpjxgp63; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_decision_quest
    ADD CONSTRAINT fk_ohm9opaarqfyqqv1rpjxgp63 FOREIGN KEY (app_obj_id) REFERENCES public.application_obj(id);


--
-- Name: scp_collateral_app fk_okbmhnv0djymq4cm89igxsv5i; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_collateral_app
    ADD CONSTRAINT fk_okbmhnv0djymq4cm89igxsv5i FOREIGN KEY (scp_arm_chief_id) REFERENCES public.sys_employee(id);


--
-- Name: mler_application fk_ol7gf9xomokn1eqmka3i4ebqf; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.mler_application
    ADD CONSTRAINT fk_ol7gf9xomokn1eqmka3i4ebqf FOREIGN KEY (initiator_id) REFERENCES public.sys_company(id);


--
-- Name: scp_application fk_olm2le1ctnjkwbrxfe5a4hjsf; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: undwrt_decis_level_dict
-- ALTER TABLE ONLY public.scp_application
--     ADD CONSTRAINT fk_olm2le1ctnjkwbrxfe5a4hjsf FOREIGN KEY (decis_level_id) REFERENCES public.undwrt_decis_level_dict(id);


--
-- Name: application_obj fk_oob2juw56g5d4o7fliq6ts6w2; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_processing_steps
-- ALTER TABLE ONLY public.application_obj
--     ADD CONSTRAINT fk_oob2juw56g5d4o7fliq6ts6w2 FOREIGN KEY (processing_steps_id) REFERENCES public.dict_processing_steps(id);


--
-- Name: afhd_ac_trans_link fk_otmk1triqqr1wmqua29t8ob7v; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: turnover_balance_sheet
-- ALTER TABLE ONLY public.afhd_ac_trans_link
--     ADD CONSTRAINT fk_otmk1triqqr1wmqua29t8ob7v FOREIGN KEY (link_turnover_reserv) REFERENCES public.turnover_balance_sheet(id);


--
-- Name: dict_product fk_oukntvsn33m6dd2ayvf4nrrdt; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: departure
-- ALTER TABLE ONLY public.dict_product
--     ADD CONSTRAINT fk_oukntvsn33m6dd2ayvf4nrrdt FOREIGN KEY (departure_id) REFERENCES public.departure(id);


--
-- Name: ic_application fk_ovr70so815rvug3o5n4r6o66x; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ic_application
    ADD CONSTRAINT fk_ovr70so815rvug3o5n4r6o66x FOREIGN KEY (afp_state_id) REFERENCES public.sys_state(id);


--
-- Name: credit_contract fk_ovv2yrnki3xo8kd8xks0ibpm0; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: wf_document
-- ALTER TABLE ONLY public.credit_contract
--     ADD CONSTRAINT fk_ovv2yrnki3xo8kd8xks0ibpm0 FOREIGN KEY (wf_document_id) REFERENCES public.wf_document(id);


--
-- Name: scp_collateral_app fk_oyxb2rd6t46ik14p57rgpf3n0; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_collateral_app
    ADD CONSTRAINT fk_oyxb2rd6t46ik14p57rgpf3n0 FOREIGN KEY (ca_exp_emp_id) REFERENCES public.sys_employee(id);


--
-- Name: credit_contract fk_p3o4qvwk0pc52nv4gljasv9on; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: etl_limit_close_na
-- ALTER TABLE ONLY public.credit_contract
--     ADD CONSTRAINT fk_p3o4qvwk0pc52nv4gljasv9on FOREIGN KEY (tech_link_etl_susp_id) REFERENCES public.etl_limit_close_na(id);


--
-- Name: product_pricing fk_p4bpjxefci662vkiv4cfax59m; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: pricing_compare
-- ALTER TABLE ONLY public.product_pricing
--     ADD CONSTRAINT fk_p4bpjxefci662vkiv4cfax59m FOREIGN KEY (pricing_compare_id) REFERENCES public.pricing_compare(id);


--
-- Name: yaig_client_guarantee fk_p5ypfrf6vvc5ujcrag7jtmn2m; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: currency
-- ALTER TABLE ONLY public.yaig_client_guarantee
--     ADD CONSTRAINT fk_p5ypfrf6vvc5ujcrag7jtmn2m FOREIGN KEY (yaig_cur_id) REFERENCES public.currency(id);


--
-- Name: corp_tech_application fk_pae4mjdtkehluisn4frxgonfg; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: credit_report
-- ALTER TABLE ONLY public.corp_tech_application
--     ADD CONSTRAINT fk_pae4mjdtkehluisn4frxgonfg FOREIGN KEY (cr_id) REFERENCES public.credit_report(id);


--
-- Name: dict_product fk_pagqu97j34rlhp5v451cjnbt1; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_loan_form
-- ALTER TABLE ONLY public.dict_product
--     ADD CONSTRAINT fk_pagqu97j34rlhp5v451cjnbt1 FOREIGN KEY (form_issue_id) REFERENCES public.dict_loan_form(id);


--
-- Name: product_pricing fk_pbqsfkhbh7vp1skb2y4v6yrlw; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: rate_type_dict
-- ALTER TABLE ONLY public.product_pricing
--     ADD CONSTRAINT fk_pbqsfkhbh7vp1skb2y4v6yrlw FOREIGN KEY (rate_type_id) REFERENCES public.rate_type_dict(id);


--
-- Name: scp_project_ans fk_pe4d9j723a2cwm2pm8anindnt; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_project_ans
    ADD CONSTRAINT fk_pe4d9j723a2cwm2pm8anindnt FOREIGN KEY (resp_risk_manager_id) REFERENCES public.sys_employee(id);


--
-- Name: prod_change_params fk_pefgg75fxdjamqnng3ai0s01m; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.prod_change_params
    ADD CONSTRAINT fk_pefgg75fxdjamqnng3ai0s01m FOREIGN KEY (product_pricing_id) REFERENCES public.product_pricing(id);


--
-- Name: mler_application fk_pjhqobvky7nwlfbyek0c2k0d6; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_client_section
-- ALTER TABLE ONLY public.mler_application
--     ADD CONSTRAINT fk_pjhqobvky7nwlfbyek0c2k0d6 FOREIGN KEY (client_section_id) REFERENCES public.scp_dict_client_section(id);


--
-- Name: scp_collateral_app fk_po6h6fsjjreyss42te29wb1j9; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_collateral_app
    ADD CONSTRAINT fk_po6h6fsjjreyss42te29wb1j9 FOREIGN KEY (parent_collat_app_id) REFERENCES public.scp_collateral_app(id);


--
-- Name: scp_part_sec_expertise fk_pob4xr45ov7cu7py0er684rgb; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_part_sec_expertise
    ADD CONSTRAINT fk_pob4xr45ov7cu7py0er684rgb FOREIGN KEY (deleg_region_id) REFERENCES public.dict_div_presence(id);


--
-- Name: corp_tech_application fk_pqp98rjnbwc4il3r0yrb1lnba; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.corp_tech_application
    ADD CONSTRAINT fk_pqp98rjnbwc4il3r0yrb1lnba FOREIGN KEY (scp_business_segment) REFERENCES public.business_segment(id);


--
-- Name: scp_application fk_ps9s6171pi1l91hty5h5ctt6s; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_application
    ADD CONSTRAINT fk_ps9s6171pi1l91hty5h5ctt6s FOREIGN KEY (voting_fm_id) REFERENCES public.sys_employee(id);


--
-- Name: scp_collateral_app fk_psro3h4ml2oe5osmjuldahirk; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: expertise
-- ALTER TABLE ONLY public.scp_collateral_app
--     ADD CONSTRAINT fk_psro3h4ml2oe5osmjuldahirk FOREIGN KEY (exp_obj_id) REFERENCES public.expertise(id);


--
-- Name: scp_project_ans fk_pxd3orsdtun3dgi8ysihjwequ; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_project_ans
    ADD CONSTRAINT fk_pxd3orsdtun3dgi8ysihjwequ FOREIGN KEY (scp_bg_owner_lidm) REFERENCES public.sys_employee(id);


--
-- Name: scp_application fk_pxtor1ltnn4lf0y5d44hpmou2; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: afhd_gsl_data_cont
-- ALTER TABLE ONLY public.scp_application
--     ADD CONSTRAINT fk_pxtor1ltnn4lf0y5d44hpmou2 FOREIGN KEY (gsl_data_cont_id) REFERENCES public.afhd_gsl_data_cont(id);


--
-- Name: scp_project_ans fk_pymxlcsx9aq5fvkbmp5mgm914; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: undwrt_decis_level_dict
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_pymxlcsx9aq5fvkbmp5mgm914 FOREIGN KEY (decis_level_id) REFERENCES public.undwrt_decis_level_dict(id);


--
-- Name: scp_decision_quest fk_q31028if2vwtgbtd4ut8u8q50; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_decision_quest
    ADD CONSTRAINT fk_q31028if2vwtgbtd4ut8u8q50 FOREIGN KEY (attr_business_segment) REFERENCES public.business_segment(id);


--
-- Name: scp_decision_quest fk_q3l33ce6f473w54623bfludp; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_decision_quest
    ADD CONSTRAINT fk_q3l33ce6f473w54623bfludp FOREIGN KEY (scp_state_id) REFERENCES public.sys_state(id);


--
-- Name: ms_dlggiqkhqj46rhq1lrgryim7c fk_q5tgcepdq2tjdam37ff81ohn0; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_dlggiqkhqj46rhq1lrgryim7c
    ADD CONSTRAINT fk_q5tgcepdq2tjdam37ff81ohn0 FOREIGN KEY (id) REFERENCES public.dict_product(id);


--
-- Name: scp_project_ans fk_q6ovn9g5ecqamc3h81ny3lwr4; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: type_payments
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_q6ovn9g5ecqamc3h81ny3lwr4 FOREIGN KEY (repayment_type_id) REFERENCES public.type_payments(id);


--
-- Name: scp_amd_product fk_q74sbvemarpx0478mx5nnfxfx; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_loan_sign
-- ALTER TABLE ONLY public.scp_amd_product
--     ADD CONSTRAINT fk_q74sbvemarpx0478mx5nnfxfx FOREIGN KEY (scp_loan_sign_id) REFERENCES public.scp_loan_sign(id);


--
-- Name: scp_application fk_qd81ucg3y2ijdchjsfptyripf; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_appl_type
-- ALTER TABLE ONLY public.scp_application
--     ADD CONSTRAINT fk_qd81ucg3y2ijdchjsfptyripf FOREIGN KEY (scp_appl_type_id) REFERENCES public.scp_dict_appl_type(id);


--
-- Name: scp_sec_check_res fk_qdvy4us9q59rnghas5qqr5keq; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: fs_bki_res_dict
-- ALTER TABLE ONLY public.scp_sec_check_res
--     ADD CONSTRAINT fk_qdvy4us9q59rnghas5qqr5keq FOREIGN KEY (bch_mem_res_id) REFERENCES public.fs_bki_res_dict(id);


--
-- Name: count_turnover fk_qk8wqp0vw51fhv0bimlijrofa; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: risk_form_row_spr
-- ALTER TABLE ONLY public.count_turnover
--     ADD CONSTRAINT fk_qk8wqp0vw51fhv0bimlijrofa FOREIGN KEY (bb_cred_reclass_id) REFERENCES public.risk_form_row_spr(id);


--
-- Name: mler_application fk_qlnygi4gvnl0oajg1n7logvak; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.mler_application
    ADD CONSTRAINT fk_qlnygi4gvnl0oajg1n7logvak FOREIGN KEY (app_product_id) REFERENCES public.dict_product(id);


--
-- Name: scp_sec_expertise fk_qpd70xuvjvm6fuacu21xbdten; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_sec_expertise
    ADD CONSTRAINT fk_qpd70xuvjvm6fuacu21xbdten FOREIGN KEY (scp_application_id) REFERENCES public.scp_application(id);


--
-- Name: scp_decision_quest fk_qufkfu3m1jnxrd2y1kpp2pgij; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_purpose_credit
-- ALTER TABLE ONLY public.scp_decision_quest
--     ADD CONSTRAINT fk_qufkfu3m1jnxrd2y1kpp2pgij FOREIGN KEY (scp_sublimit_purpose) REFERENCES public.scp_purpose_credit(id);


--
-- Name: scp_project_ans fk_qv0bcbo354m0dfslsnags5cte; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: underwrit_application
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_qv0bcbo354m0dfslsnags5cte FOREIGN KEY (undwrit_appl_id) REFERENCES public.underwrit_application(id);


--
-- Name: scp_decision_quest fk_qvgr5pakhx4p7xw9ori3cwst7; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_decision_quest
    ADD CONSTRAINT fk_qvgr5pakhx4p7xw9ori3cwst7 FOREIGN KEY (scp_subl_bor) REFERENCES public.sys_company(id);


--
-- Name: afhd_ac_trans_link fk_qwekgkq85x7t5u8lmk6h76t8a; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: turnover_balance_sheet
-- ALTER TABLE ONLY public.afhd_ac_trans_link
--     ADD CONSTRAINT fk_qwekgkq85x7t5u8lmk6h76t8a FOREIGN KEY (link_turnover) REFERENCES public.turnover_balance_sheet(id);


--
-- Name: corp_tech_application fk_qyqyeuvdra5hdbvu2a5ud1vdw; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.corp_tech_application
    ADD CONSTRAINT fk_qyqyeuvdra5hdbvu2a5ud1vdw FOREIGN KEY (scp_cheif_cm_id) REFERENCES public.sys_employee(id);


--
-- Name: afhd_ac_trans_link fk_r1cgliub44diheswgjqx7mdsq; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: statement_trans
-- ALTER TABLE ONLY public.afhd_ac_trans_link
--     ADD CONSTRAINT fk_r1cgliub44diheswgjqx7mdsq FOREIGN KEY (statem_trans_id) REFERENCES public.statement_trans(id);


--
-- Name: scp_sec_expertise fk_r668pq6fwoif61nkd4tq3nr8q; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_sec_expertise
    ADD CONSTRAINT fk_r668pq6fwoif61nkd4tq3nr8q FOREIGN KEY (emp_id) REFERENCES public.sys_employee(id);


--
-- Name: mler_application fk_r7oxjfx42ub4lrxg4wb8m9f0s; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.mler_application
    ADD CONSTRAINT fk_r7oxjfx42ub4lrxg4wb8m9f0s FOREIGN KEY (scp_business_segment) REFERENCES public.business_segment(id);


--
-- Name: scp_project_ans fk_r8dqtj77euejtoa9w556sy7os; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_analys_result_cl
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_r8dqtj77euejtoa9w556sy7os FOREIGN KEY (analys_res_cl_restr_id) REFERENCES public.scp_analys_result_cl(id);


--
-- Name: credit_contract fk_ra0v6jdtirdlxucsp0bnb1w1w; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: chosen_measure
-- ALTER TABLE ONLY public.credit_contract
--     ADD CONSTRAINT fk_ra0v6jdtirdlxucsp0bnb1w1w FOREIGN KEY (tech_selected_meas_id) REFERENCES public.chosen_measure(id);


--
-- Name: scp_application fk_ra8n7fk6j2ccxeu3g5whbl25v; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_application
    ADD CONSTRAINT fk_ra8n7fk6j2ccxeu3g5whbl25v FOREIGN KEY (auto_check_status) REFERENCES public.sys_state(id);


--
-- Name: ms_d1oakp9uq175ak3dbhpzbu81d fk_rbq967cehgdo173pd1rbld9y; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_d1oakp9uq175ak3dbhpzbu81d
    ADD CONSTRAINT fk_rbq967cehgdo173pd1rbld9y FOREIGN KEY (obj_id) REFERENCES public.sys_state(id);


--
-- Name: scp_project_ans fk_repm9vwk1uuvh4yfrwp7mey65; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_project_ans
    ADD CONSTRAINT fk_repm9vwk1uuvh4yfrwp7mey65 FOREIGN KEY (scp_chief_ca_id) REFERENCES public.sys_employee(id);


--
-- Name: yaig_client_guarantee fk_rexety2mcy45id2a2eg2qd1mb; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_contract_group
-- ALTER TABLE ONLY public.yaig_client_guarantee
--     ADD CONSTRAINT fk_rexety2mcy45id2a2eg2qd1mb FOREIGN KEY (contr_group_id) REFERENCES public.dict_contract_group(id);


--
-- Name: participant_app fk_rfkk4p87mak9a8wk472f0nosr; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.participant_app
    ADD CONSTRAINT fk_rfkk4p87mak9a8wk472f0nosr FOREIGN KEY (obj_owner_id) REFERENCES public.sys_object(id);


--
-- Name: ms_0golbfqyrdq4im6jf6ajivwy9 fk_rh9xjii8soru7liew3uek3wwp; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_0golbfqyrdq4im6jf6ajivwy9
    ADD CONSTRAINT fk_rh9xjii8soru7liew3uek3wwp FOREIGN KEY (id) REFERENCES public.scp_gov_program_dict(id);


--
-- Name: scp_application fk_rke1lq7i8p6aoyxfjy9083ebj; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: temp_obj_load_turn
-- ALTER TABLE ONLY public.scp_application
--     ADD CONSTRAINT fk_rke1lq7i8p6aoyxfjy9083ebj FOREIGN KEY (temp_cont_turn) REFERENCES public.temp_obj_load_turn(id);


--
-- Name: scp_decision_quest fk_rkw7w38gqx1brf9owqwqk90gf; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_purpose_credit
-- ALTER TABLE ONLY public.scp_decision_quest
--     ADD CONSTRAINT fk_rkw7w38gqx1brf9owqwqk90gf FOREIGN KEY (credit_purpose_id) REFERENCES public.scp_purpose_credit(id);


--
-- Name: offices_psb fk_rmpamn2iu6ueh7jnxt4yfs6x7; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: sys_org_str_view
-- ALTER TABLE ONLY public.offices_psb
--     ADD CONSTRAINT fk_rmpamn2iu6ueh7jnxt4yfs6x7 FOREIGN KEY (view_id) REFERENCES public.sys_org_str_view(id);


--
-- Name: mler_application fk_rni0n6irya1djylkobn4csiwo; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.mler_application
    ADD CONSTRAINT fk_rni0n6irya1djylkobn4csiwo FOREIGN KEY (credit_logic_id) REFERENCES public.scp_techcred(id);


--
-- Name: scp_collateral_app fk_rnurcr5wrlpitqf4iih0qdkw3; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: quest_structure
-- ALTER TABLE ONLY public.scp_collateral_app
--     ADD CONSTRAINT fk_rnurcr5wrlpitqf4iih0qdkw3 FOREIGN KEY (quest_decis_id) REFERENCES public.quest_structure(id);


--
-- Name: sys_employee fk_robme31o6s371uach4y335j10; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.sys_employee
    ADD CONSTRAINT fk_robme31o6s371uach4y335j10 FOREIGN KEY (ps_office) REFERENCES public.offices_psb(id);


--
-- Name: corp_tech_application fk_rqltyylhko7lt77fwhwtatiao; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_industry_code
-- ALTER TABLE ONLY public.corp_tech_application
--     ADD CONSTRAINT fk_rqltyylhko7lt77fwhwtatiao FOREIGN KEY (industry_code_id) REFERENCES public.scp_dict_industry_code(id);


--
-- Name: mler_application fk_rsmewc9adbwas81q081xux7tc; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: afhd_gsl_data_cont
-- ALTER TABLE ONLY public.mler_application
--     ADD CONSTRAINT fk_rsmewc9adbwas81q081xux7tc FOREIGN KEY (gsl_data_cont_id) REFERENCES public.afhd_gsl_data_cont(id);


--
-- Name: ic_application fk_rsvdflydl3pq45sb4yhnhofmu; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_reason_client
-- ALTER TABLE ONLY public.ic_application
--     ADD CONSTRAINT fk_rsvdflydl3pq45sb4yhnhofmu FOREIGN KEY (scp_rejection_client_id) REFERENCES public.scp_dict_reason_client(id);


--
-- Name: afhd_ac_trans_link fk_rtex0blpr1joa3mj45f5sqxvx; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: credit_report
-- ALTER TABLE ONLY public.afhd_ac_trans_link
--     ADD CONSTRAINT fk_rtex0blpr1joa3mj45f5sqxvx FOREIGN KEY (cr_id) REFERENCES public.credit_report(id);


--
-- Name: scp_application fk_rtg3vu9tek0pv49k4i9ky4387; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_application
    ADD CONSTRAINT fk_rtg3vu9tek0pv49k4i9ky4387 FOREIGN KEY (afp_state_id) REFERENCES public.sys_state(id);


--
-- Name: sys_obj_type fk_rtm81tb04wlukhmlyqmwd3k15; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: sys_access_type
-- ALTER TABLE ONLY public.sys_obj_type
--     ADD CONSTRAINT fk_rtm81tb04wlukhmlyqmwd3k15 FOREIGN KEY (access_type_id) REFERENCES public.sys_access_type(id);


--
-- Name: scp_application fk_rv5babalmdlkpw3plgio1e7c8; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_reason_refusal
-- ALTER TABLE ONLY public.scp_application
--     ADD CONSTRAINT fk_rv5babalmdlkpw3plgio1e7c8 FOREIGN KEY (reason_refusal_id) REFERENCES public.scp_dict_reason_refusal(id);


--
-- Name: sys_obj_type fk_rxp7yqcr5iw0527wo7b2aqdsb; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: sys_etl_db_connect
-- ALTER TABLE ONLY public.sys_obj_type
--     ADD CONSTRAINT fk_rxp7yqcr5iw0527wo7b2aqdsb FOREIGN KEY (rf_connection) REFERENCES public.sys_etl_db_connect(id);


--
-- Name: scp_application fk_ry7wev9acl725ipt9glcfu9m4; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_application
    ADD CONSTRAINT fk_ry7wev9acl725ipt9glcfu9m4 FOREIGN KEY (scp_arm_manager_id) REFERENCES public.sys_employee(id);


--
-- Name: scp_amd_product fk_ryv4wx9doc29gb7t0qjxueje7; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: product_compound_dict
-- ALTER TABLE ONLY public.scp_amd_product
--     ADD CONSTRAINT fk_ryv4wx9doc29gb7t0qjxueje7 FOREIGN KEY (product_compound_id) REFERENCES public.product_compound_dict(id);


--
-- Name: scp_project_ans fk_ryyxh6529bepxn0xat4sn0id9; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_project_ans
    ADD CONSTRAINT fk_ryyxh6529bepxn0xat4sn0id9 FOREIGN KEY (resp_head_cm_id) REFERENCES public.sys_employee(id);


--
-- Name: scp_project_ans fk_s2vo0mfdhstpe3i99aw7hsgtk; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_amd_monit_regul
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_s2vo0mfdhstpe3i99aw7hsgtk FOREIGN KEY (limit_confirmation) REFERENCES public.scp_amd_monit_regul(id);


--
-- Name: mler_application fk_s65jcc4tck0s87wik1kt6qh8h; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.mler_application
    ADD CONSTRAINT fk_s65jcc4tck0s87wik1kt6qh8h FOREIGN KEY (mler_signer_id) REFERENCES public.sys_employee(id);


--
-- Name: mler_application fk_s8hmvt982l0gutgys55vcnbca; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: afhd_gsl_calc_cont
-- ALTER TABLE ONLY public.mler_application
--     ADD CONSTRAINT fk_s8hmvt982l0gutgys55vcnbca FOREIGN KEY (prelim_gsl_calc_id) REFERENCES public.afhd_gsl_calc_cont(id);


--
-- Name: corp_tech_application fk_s8q1svybnphog5tvjm43uwpa7; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: afhd_gsl_data_cont
-- ALTER TABLE ONLY public.corp_tech_application
--     ADD CONSTRAINT fk_s8q1svybnphog5tvjm43uwpa7 FOREIGN KEY (gsl_data_cont_id) REFERENCES public.afhd_gsl_data_cont(id);


--
-- Name: corp_tech_application fk_sc3k1cpn9pchmdacmtu6s1j37; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.corp_tech_application
    ADD CONSTRAINT fk_sc3k1cpn9pchmdacmtu6s1j37 FOREIGN KEY (ca_rout_office_id) REFERENCES public.offices_psb(id);


--
-- Name: ms_64cm5ded37z58x0fyt5lgvhc7 fk_scfqpbqkdsp9labyw7pcnhfw2; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_64cm5ded37z58x0fyt5lgvhc7
    ADD CONSTRAINT fk_scfqpbqkdsp9labyw7pcnhfw2 FOREIGN KEY (id) REFERENCES public.scp_dict_rsc_office(id) ON DELETE CASCADE;


--
-- Name: scp_application fk_scja2iok83qydg377n1g8moyk; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: clc_grades
-- ALTER TABLE ONLY public.scp_application
--     ADD CONSTRAINT fk_scja2iok83qydg377n1g8moyk FOREIGN KEY (clc_grade_id) REFERENCES public.clc_grades(id);


--
-- Name: scp_part_sec_expertise fk_sjm56eqpmay9avxv7bd4bbjfs; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_part_sec_expertise
    ADD CONSTRAINT fk_sjm56eqpmay9avxv7bd4bbjfs FOREIGN KEY (afp_state_id) REFERENCES public.sys_state(id);


--
-- Name: sys_company fk_sldi8oq0sc3m0q24374fsx8dr; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_bankruptcy_stage
-- ALTER TABLE ONLY public.sys_company
--     ADD CONSTRAINT fk_sldi8oq0sc3m0q24374fsx8dr FOREIGN KEY (stage_of_bankruptcy) REFERENCES public.dict_bankruptcy_stage(id);


--
-- Name: scp_project_ans fk_slsr0upws70nnf54euo02jsxq; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: quest_structure
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_slsr0upws70nnf54euo02jsxq FOREIGN KEY (question_link_id) REFERENCES public.quest_structure(id);


--
-- Name: scp_project_ans fk_so1m0jwdblqur28x0hqlrod9f; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_amd_collateral_type
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_so1m0jwdblqur28x0hqlrod9f FOREIGN KEY (mon_col_type_id) REFERENCES public.scp_amd_collateral_type(id);


--
-- Name: product_pricing fk_sqatpqma9ylusik3aaq0nj6q2; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.product_pricing
    ADD CONSTRAINT fk_sqatpqma9ylusik3aaq0nj6q2 FOREIGN KEY (amdp_parent_product_id) REFERENCES public.scp_amd_product(id);


--
-- Name: mler_application fk_sqtynl8skd029bhblflb4pyn8; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.mler_application
    ADD CONSTRAINT fk_sqtynl8skd029bhblflb4pyn8 FOREIGN KEY (scp_cheif_cm_id) REFERENCES public.sys_employee(id);


--
-- Name: ms_0oc5mpme8nklimjy77sai9gf1 fk_srj1fieltod523a2jd3o632s; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_0oc5mpme8nklimjy77sai9gf1
    ADD CONSTRAINT fk_srj1fieltod523a2jd3o632s FOREIGN KEY (obj_id) REFERENCES public.dict_product(id);


--
-- Name: scp_prod_comm_dict fk_ss0h574gkvo1eilis5fp6ltuf; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_prod_comm_dict
    ADD CONSTRAINT fk_ss0h574gkvo1eilis5fp6ltuf FOREIGN KEY (scp_gov_program_id) REFERENCES public.scp_gov_program_dict(id);


--
-- Name: ms_965j58mgwkpomnuooc29dlq9f fk_su5vfan7juqf8ujjlr2p62dfb; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_965j58mgwkpomnuooc29dlq9f
    ADD CONSTRAINT fk_su5vfan7juqf8ujjlr2p62dfb FOREIGN KEY (obj_id) REFERENCES public.scp_techcred(id);


--
-- Name: dict_product fk_svoxolu8gwitsnr0awk7c49nt; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: type_limit_over
-- ALTER TABLE ONLY public.dict_product
--     ADD CONSTRAINT fk_svoxolu8gwitsnr0awk7c49nt FOREIGN KEY (type_limit_over_id) REFERENCES public.type_limit_over(id);


--
-- Name: dict_product fk_svs1jull6lmuojv6tdsnwo4kj; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: commissions
-- ALTER TABLE ONLY public.dict_product
--     ADD CONSTRAINT fk_svs1jull6lmuojv6tdsnwo4kj FOREIGN KEY (comissions_id) REFERENCES public.commissions(id);


--
-- Name: ms_e5lum3lbateqhx8wkgtstxdf9 fk_syimokm26is1x38np0xkbhwpu; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.ms_e5lum3lbateqhx8wkgtstxdf9
    ADD CONSTRAINT fk_syimokm26is1x38np0xkbhwpu FOREIGN KEY (id) REFERENCES public.dict_product(id);


--
-- Name: sys_obj_type fk_t0ekxl3di7i99bm16gmgyptyy; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: sys_type_attr
-- ALTER TABLE ONLY public.sys_obj_type
--     ADD CONSTRAINT fk_t0ekxl3di7i99bm16gmgyptyy FOREIGN KEY (attr_with_name) REFERENCES public.sys_type_attr(id);


--
-- Name: sys_obj_resp fk_t2r19t57xi66142dssidooqbn; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.sys_obj_resp
    ADD CONSTRAINT fk_t2r19t57xi66142dssidooqbn FOREIGN KEY (afe_current_resp) REFERENCES public.sys_obj_resp(id);


--
-- Name: application_obj fk_t3va7bl7ofndorx4df7wgwrj5; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.application_obj
    ADD CONSTRAINT fk_t3va7bl7ofndorx4df7wgwrj5 FOREIGN KEY (emp_id) REFERENCES public.sys_employee(id);


--
-- Name: product_pricing fk_t6lmgo4xlteoftlup2mdllifr; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: clc_grades
-- ALTER TABLE ONLY public.product_pricing
--     ADD CONSTRAINT fk_t6lmgo4xlteoftlup2mdllifr FOREIGN KEY (clc_grade_id) REFERENCES public.clc_grades(id);


--
-- Name: scp_project_ans fk_t7nvwpqrvu6l68wotow6mh4yo; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_dict_credit_group
-- ALTER TABLE ONLY public.scp_project_ans
--     ADD CONSTRAINT fk_t7nvwpqrvu6l68wotow6mh4yo FOREIGN KEY (credit_group_id) REFERENCES public.scp_dict_credit_group(id);


--
-- Name: dict_product fk_t8nvadfosw0wmxr9rf2x1yifm; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_order_pay_percent
-- ALTER TABLE ONLY public.dict_product
--     ADD CONSTRAINT fk_t8nvadfosw0wmxr9rf2x1yifm FOREIGN KEY (payment_interest_id) REFERENCES public.dict_order_pay_percent(id);


--
-- Name: scp_part_sec_expertise fk_t8q8c28t931na9qwctpx0f5n6; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: dict_scp_risk_zone
-- ALTER TABLE ONLY public.scp_part_sec_expertise
--     ADD CONSTRAINT fk_t8q8c28t931na9qwctpx0f5n6 FOREIGN KEY (risk_zone_id) REFERENCES public.dict_scp_risk_zone(id);


--
-- Name: scp_gov_program_dict fk_tcl72ydyj0ceyrpo3xuu23ilo; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: scp_type_gov_prog
-- ALTER TABLE ONLY public.scp_gov_program_dict
--     ADD CONSTRAINT fk_tcl72ydyj0ceyrpo3xuu23ilo FOREIGN KEY (type_gov_prog_id) REFERENCES public.scp_type_gov_prog(id);


--
-- Name: scp_sec_expertise fk_td0l5r0jvkygjc4qh5yfg4pce; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: registration_app
-- ALTER TABLE ONLY public.scp_sec_expertise
--     ADD CONSTRAINT fk_td0l5r0jvkygjc4qh5yfg4pce FOREIGN KEY (csd_expertise_obj_id) REFERENCES public.registration_app(id);


--
-- Name: scp_project_ans fk_tffkl7hf6nrl8y31h5uds1x8i; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_project_ans
    ADD CONSTRAINT fk_tffkl7hf6nrl8y31h5uds1x8i FOREIGN KEY (refer_empl) REFERENCES public.sys_employee(id);


--
-- Name: scp_sec_check_res fk_tgl6o4f7grw5p8ky85yti3i34; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_sec_check_res
    ADD CONSTRAINT fk_tgl6o4f7grw5p8ky85yti3i34 FOREIGN KEY (emp_id) REFERENCES public.sys_employee(id);


--
-- Name: prod_change_params fk_tq3abqfq311fm834nymstmkw9; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: payment_schedule_dict
-- ALTER TABLE ONLY public.prod_change_params
--     ADD CONSTRAINT fk_tq3abqfq311fm834nymstmkw9 FOREIGN KEY (payment_schedule_id) REFERENCES public.payment_schedule_dict(id);


--
-- Name: corp_tech_application fk_tqwlqphkcvct4afgc6ad1qg60; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: currency
-- ALTER TABLE ONLY public.corp_tech_application
--     ADD CONSTRAINT fk_tqwlqphkcvct4afgc6ad1qg60 FOREIGN KEY (lim_currency_id) REFERENCES public.currency(id);


--
-- Name: scp_part_sec_expertise fk_trjr6le0jnbwg8xi8c7lj2p0r; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

ALTER TABLE ONLY public.scp_part_sec_expertise
    ADD CONSTRAINT fk_trjr6le0jnbwg8xi8c7lj2p0r FOREIGN KEY (expertise_obj_id) REFERENCES public.participant_app(id);


--
-- Name: credit_contract fk_u2yuhjfs3l9d9bqv3b01pj71; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: app_pre_aprov_pack_loan
-- ALTER TABLE ONLY public.credit_contract
--     ADD CONSTRAINT fk_u2yuhjfs3l9d9bqv3b01pj71 FOREIGN KEY (applic_ko_kbkp_id) REFERENCES public.app_pre_aprov_pack_loan(id);


--
-- Name: scp_prod_guar_dict fk_x9d62snea3ug9icpcqw4sgvj; Type: FK CONSTRAINT; Schema: public; Owner: moon_tuning
--

-- skipped invalid FK, missing referenced table: payment_schedule_dict
-- ALTER TABLE ONLY public.scp_prod_guar_dict
--     ADD CONSTRAINT fk_x9d62snea3ug9icpcqw4sgvj FOREIGN KEY (payment_schedule_id) REFERENCES public.payment_schedule_dict(id);


--
-- PostgreSQL database dump complete
--


