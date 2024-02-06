namespace com.kamal.studentdb;
using { managed, cuid } from '@sap/cds/common';

@assert.unique:{
    studentid:[studentid]
}
entity Student: cuid, managed {
    @title: 'Student ID'
    studentid: String(5);
    @title: 'Gender'
    gender: String(1);
    @title: 'First Name'
    first_name: String(40) @mandatory;
    @title: 'Last Name'
    last_name: String(40) @mandatory;
    @title: 'Email ID'
    email_id: String(100) @mandatory;
    @title: 'Date of Birth'
    dob: Date @mandatory;
    @title: 'Course'
    course: Association to Courses;
    @title:'IS Aumni'
    is_alumni: Boolean default false;
    @title: 'Languages Known'
    Languages: Composition of many {
        key ID: UUID;
        lang: Association to Languages;
    };
    @title: 'Age'
    virtual age: Integer @Core.Computed;
}

@cds.persistence.skip
entity Gender {
    @title: 'code'
    key code: String(1);
    @title: 'Description'
    description: String(10);
}

entity Courses: cuid, managed {
    @title: 'Code'
    code: String(3);
    @title: 'Description'
    description: String(50);
    @title: 'Books'
    Books: Composition of many {
        key ID: UUID;
        books: Association to Books;
    };
}
entity Languages : cuid, managed {
    @title: 'Code'
    code: String(3);
    @title: 'Description'
    description: String(50);
}
entity Books : cuid, managed {
    @title: 'Code'
    code: String(3);
    @title: 'Description'
    description: String(50);
}