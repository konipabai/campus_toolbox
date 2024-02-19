import { Entity, Column, PrimaryGeneratedColumn } from "typeorm"

@Entity()
export class resultRecruitment {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ type: 'varchar', length: 255, nullable: false })
    name: string;                // 公司名

    @Column({ type: 'varchar', length: 255, nullable: false })
    job: string;                 // 岗位

    @Column({ type: 'varchar', length: 255, nullable: false })
    description: string;         // 公司简介

    @Column({ type: 'int', nullable: false })
    salary: number;              // 工资

    @Column({ type: 'varchar', length: 255, nullable: false })
    requirements: string;        // 岗位要求

    @Column({ type: 'varchar', length: 255, nullable: false })
    benefits: string;            // 公司福利

    @Column({ type: 'varchar', length: 255, nullable: false })
    contact: string;             // 联系方式

    @Column({ type: 'varchar', length: 255, nullable: false })
    hr: string;                  // hr

    @Column({ type: 'varchar', length: 255, nullable: false })
    location: string;            // 地址
}