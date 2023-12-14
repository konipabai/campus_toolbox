import { Entity, Column, PrimaryGeneratedColumn } from "typeorm"

@Entity()
export class resultLostFound {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ type: 'varchar', length: 255, nullable: false })
    account: string;             // 账号

    @Column({ type: 'varchar', length: 255, nullable: false })
    state: string;               // 寻/拾

    @Column({ type: 'varchar', length: 255, nullable: false })
    item: string;                // 物品

    @Column({ type: 'varchar', length: 255, nullable: false })
    brand: string;               // 品牌

    @Column({ type: 'varchar', length: 255, nullable: false })
    location: string;            // 地点

    @Column({ type: 'varchar', length: 255, nullable: false })
    description: string;         // 描述

    @Column({ type: 'varchar', length: 255, nullable: false })
    contact: string;             // 联系方式

    @Column({ type: 'varchar', length: 255, nullable: false })
    time: string;                // 申请的时间

    @Column({ type: 'varchar', length: 255, nullable: false })
    switch: string;              // 开关

    @Column({ type: 'varchar', length: 255, nullable: false })
    overdue: string;             // 是否过期
}