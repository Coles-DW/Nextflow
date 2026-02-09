#!/usr/bin/env nextflow

/*
 * Use echo to print 'Hello World!' to a file
 */
process sayHello {

    output:
    path 'output.txt'

    script:
    """
    echo 'Hello World!' > output.txt
    """
}

workflow {

    main:
    // emit a greeting
    sayHello()

    publish:
    first_output = sayHello.out
}
output {
    first_output {
        path '.' #<- change . to hello_world and you will get a soecific folder under results where result will go.
    }
}

#Set the publish mode to copy
#!/usr/bin/env nextflow

/*
 * Use echo to print 'Hello World!' to a file
 */
process sayHello {

    output:
    path 'output.txt'

    script:
    """
    echo 'Hello World!' > output.txt
    """
}

workflow {

    main:
    // emit a greeting
    sayHello()

    publish:
    first_output = sayHello.out
}
output {
    first_output {
        path 'hello_world'
        mode 'copy'
    }
}

nextflow run hello-world.nf

#publishDir directive (we do not recommend using it in any new work as it will eventually be disallowed in future versions of the Nextflow language.)
process sayHello {

    publishDir 'results/hello_world', mode: 'copy'

    output:
    path 'output.txt'

    script:
    """
    echo 'Hello World!' > output.txt
    """
}
