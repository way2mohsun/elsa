let users =
    [
        {
            desc: "Be at least 16 characters long",
            first_name: 'Becci',
            last_name: 'Watson',
            email: 'becci@becciwatson.com.au',
            password: 'Ch0col@te!',
            repassword: 'Ch0col@te!',
        },
        {
            desc: "Contain at least one Upper Case letter of the alphabet",
            first_name: 'Becci',
            last_name: 'Watson',
            email: 'becci@becciwatson.com.au',
            password: 'ch0col@te!isyummy',
            repassword: 'ch0col@te!isyummy',
        },
        {
            desc: "Contain at least one Lower Case letter of the alphabet",
            first_name: 'Becci',
            last_name: 'Watson',
            email: 'becci@becciwatson.com.au',
            password: 'CH0COL@TE!ISYUMMY',
            repassword: 'CH0COL@TE!ISYUMMY',
        },
        {
            desc: "Contain at least one special character or symbol (example: ~!@#|\[]{}$%^&*()_-+=<>?/)",
            first_name: 'Becci',
            last_name: 'Watson',
            email: 'becci@becciwatson.com.au',
            password: 'cH0COLTEISYUMMY',
            repassword: 'cH0COLTEISYUMMY',
        },
        {
            desc: "Repeated password must be identical",
            first_name: 'Becci',
            last_name: 'Watson',
            email: 'becci@becciwatson.com.au',
            password: 'Ch0col@te!IsYummy',
            repassword: 'ch0col@te!IsYummy',
        },
        {
            desc: "Must not contain any part of your First Name pp field: user_first_name",
            first_name: 'Becci',
            last_name: 'Watson',
            email: 'becci@becciwatson.com.au',
            password: 'H0COLbeCCi@TEISYUMMY',
            repassword: 'H0COLbeCCi@TEISYUMMY',
        },
        /*

        {
            desc: "",
            first_name: 'Becci',
            last_name: 'Watson',
            email: 'becci@becciwatson.com.au',
            password: '',
            repassword: '',
        },

        */
    ]

for (let i = 0; i < users.length; ++i) {
    describe(i + " : " + users[i].first_name + " : " + users[i].last_name + " : pass=" + users[i].password, () => {
        test(users[i].desc, () => {
            expect(password_criteria(users[i], criterias)).toBeNull();
        });
    });
}

const criterias = {
    'matching-password-with-repassword': {
        message: 'Repassword is not matched.',
        rule: null,
        must: false,
        must_not: false
    },
    'minimum-password-length': {
        message: 'Minimum password length should be 16 characters.',
        rule: '16',
        must: false,
        must_not: false
    },
    'maximum-password-length': {
        message: 'maximum password length is 32 characters.',
        rule: '64',
        must: false,
        must_not: false
    },
    email: {
        message: 'Email format is wrong.',
        rule: '[a-zA-Z][a-zA-Z0-9_\\.]{1,32}@[a-z0-9]{2,}(\\.[a-z0-9]{2,4}){1,2}',
        must: false,
        must_not: false
    },
    'empty-firstname': {
        message: 'Firstname is empty.',
        rule: '0',
        must: false,
        must_not: false
    },
    'empty-lastname': {
        message: 'Lastname is empty.',
        rule: '0',
        must: false,
        must_not: false
    },
    'at-least-one-upper-case-letter': {
        message: 'Password must contain at least one upper case letter.',
        rule: '[A-Z]+',
        must: true,
        must_not: false
    },
    'at-least-one-lower-case-letter': {
        message: 'Password must contain at least one lower case letter.',
        rule: '[a-z]+',
        must: true,
        must_not: false
    },
    'at-least-one-special-character': {
        message: 'Password must contain at least one special character.',
        rule: '\\~|\\`|\\!|\\@|\\#|\\$|\\%|\\^|\\&|\\*|\\(|\\)|\\-|\\_|\\+|\\=|\\{|\\}|\\[|\\]|\\;|\\:|\\"|\\<|\\>|\\,|\\.|\\/|\\?|(\\|)|\\\\',
        must: true,
        must_not: false
    },
    'sequential-keyboard-1': {
        message: 'Password must not contain sequential keyboard.',
        rule: '(1){3,}|(2){3,}|(3){3,}|(4){3,}|(5){3,}|(6){3,}|(7){3,}|(8){3,}|(9){3,}|(0){3,}',
        must: false,
        must_not: true
    },
    'sequential-keyboard-2': {
        message: 'Password must not contain sequential keyboard.',
        rule: '0123|1234|2345|3456|4567|5678|6789|3210|4321|5432|6543|7654|8765|9876|0000|1111|2222|3333|4444|5555|6666|7777|8888|9999',
        must: false,
        must_not: true
    },
    'sequential-keyboard-3': {
        message: 'Password must not contain sequential keyboard.',
        rule: 'qwerty|1qaz|zaq1|2wsx|xsw2|asdf|zxcv',
        must: false,
        must_not: true
    },
    'brand-name': {
        message: 'Must not contain any part of our brand name (example: practitioner, pulse).',
        rule: 'practitioner|pulse|becci|watsone',
        must: false,
        must_not: true
    },
    'relating-to-job-title': {
        message: 'Must not use words relating to your job title or role (examples:  nurse, doctor, GP, practice, manager, intern, specialist, 2IC, registrar, receptionist, owner, user, admin, administrator, director, CEO, CIO, CTO, CFO, chief, officer)',
        rule: 'nurse|doctor|gp|practice|manager|intern|specialist|2ic|registrar|receptionist|owner|user|admin|administrator|director|ceo|cio|cto|cfo|chief|officer',
        must: false,
        must_not: true
    },
    'relating-to-department-function': {
        message: 'Must not use words that describe your department or function (examples: reception, administration, operation/s, IT, HR, account/s, accounting, finance, dept, department)',
        rule: 'reception|administration|operation\\/s|it|hr|account\\/s|accounting|finance|dept|department',
        must: false,
        must_not: true
    },
    'relating-to-business': {
        message: 'Must not contain any word that forms part of your business Account or the name of any Centre, clinic or practice related to the Account (examples: clinic, centre, medical).',
        rule: 'clinic|centre|medical',
        must: false,
        must_not: true
    },
    'at-least-one-number': {
        message: 'Contain at least one number.',
        rule: '[0-9]',
        must: true,
        must_not: false
    },
    space: {
        message: 'Must not contain any space.',
        rule: ' ',
        must: false,
        must_not: true
    },
    'part-of-firstname': {
        message: 'Must not contain any part of your First Name.',
        rule: null,
        must: false,
        must_not: false
    },
    'part-of-lastname': {
        message: 'Must not contain any part of your Last Name.',
        rule: null,
        must: false,
        must_not: false
    },
    'part-of-email': {
        message: 'Must not contain any part of email.',
        rule: null,
        must: false,
        must_not: false
    },
    'max-length-firstname': {
        message: 'Firstname exceeds maximum length',
        rule: '50',
        must: false,
        must_not: false
    },
    'max-length-lastname': {
        message: 'Lastname exceeds maximum length',
        rule: '50',
        must: false,
        must_not: false
    },
    'min-length-firstname': {
        message: 'Minimum firstname length should be 3 characters.',
        rule: '3',
        must: false,
        must_not: false
    },
    'min-length-lastname': {
        message: 'Minimum lastname length should be 3 characters.',
        rule: '3',
        must: false,
        must_not: false
    }
}

let password_criteria = (new_user, criteria) => {
    try {
        let password = new_user.password;
        var key = 'matching-password-with-repassword';
        if (new_user.password.localeCompare(new_user.repassword) !== 0) {
            return criteria[key].message;
        }
        key = 'minimum-password-length';
        if (password.length < criteria[key].rule) {
            return criteria[key].message;
        }
        key = 'maximum-password-length';
        if (password.length > criteria[key].rule) {
            return criteria[key].message;
        }
        key = 'email';
        if (new_user.email.match(new RegExp(criteria[key].rule, 'g')) === null) {
            return criteria[key].message;
        }
        key = 'part-of-email';
        let [email_left_part, email_right_part] = new_user.email.toLowerCase().replace(/\.\w+/, '').split('@');
        if (password.toLowerCase().includes(email_left_part) || password.toLowerCase().includes(email_right_part)) {
            return criteria[key].message;
        }
        for (let [item, value] of Object.entries(criteria)) {
            if (!(value.must_not || value.must)) {
                continue;
            }
            if (value.must) {
                if (password.match(new RegExp(value.rule, 'g')) === null) {
                    return value.message;
                }
            }
            if (value.must_not) {
                if (password.toLowerCase().match(new RegExp(value.rule, 'g')) !== null) {
                    return value.message;
                }
            }
        }
        return null;
    } catch (e) {
        console.log(e)
        return e;
    }
}

let name_criteria = (new_user, criteria) => {
    let key = 'empty-firstname';
    if (new_user.first_name.length < 1) {
        return criteria[key].message;
    }
    key = 'max-length-firstname';
    if (new_user.first_name.length > criteria[key].rule) {
        return criteria[key].message;
    }
    key = 'min-length-firstname';
    if (new_user.first_name.length < criteria[key].rule) {
        return criteria[key].message;
    }
    key = 'empty-lastname';
    if (new_user.last_name.length < 1) {
        return criteria[key].message;
    }
    key = 'max-length-lastname';
    if (new_user.last_name.length > criteria[key].rule) {
        return criteria[key].message;
    }
    key = 'min-length-lastname';
    if (new_user.last_name.length < criteria[key].rule) {
        return criteria[key].message;
    }
    key = 'part-of-firstname';
    if (new_user.password.includes(new_user.first_name)) {
        return criteria[key].message;
    }
    key = 'part-of-lastname';
    if (new_user.password.includes(new_user.last_name)) {
        return criteria[key].message;
    }
}

